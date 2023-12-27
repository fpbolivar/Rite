

import 'package:pinput/pinput.dart';
import 'package:rite_funeral_flutter/imports.dart';

class PinCodeFields extends StatefulWidget {
  const PinCodeFields({Key? key, this.controller, this.formKey})
      : super(key: key);

  final TextEditingController? controller;
  final GlobalKey? formKey;

  @override
  State<PinCodeFields> createState() => _PinCodeFieldsState();
}

class _PinCodeFieldsState extends State<PinCodeFields> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColors.primary;

    final defaultPinTheme = PinTheme(
      width: 77.w,
      height: 60.h,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color:Colors.grey.withOpacity(0.2)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 12,
              offset: Offset(0, 6),
              spreadRadius: 0,
            )
          ]),
    );
    final focusedTheme = PinTheme(
      width: 77.w,
      height: 60.h,
      textStyle: const TextStyle(
        fontSize: 18,
        color: AppColors.greyTextColor,
      ),
      decoration: BoxDecoration(
          color: AppColors.textFieldColor,
          borderRadius: BorderRadius.circular(10.r),
          // border: Border.all(color: AppColors.primary),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 8,
              offset: Offset(0, 6),
              spreadRadius: 0,
            )
          ]),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: widget.controller,
              focusNode: focusNode,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Provide Otp';
                }
                return null;
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              enabled: true,
              errorTextStyle: Styles.regular(
                  fontSize: 12.sp, color: Colors.red),
              focusedPinTheme: focusedTheme,
              submittedPinTheme: focusedTheme,
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

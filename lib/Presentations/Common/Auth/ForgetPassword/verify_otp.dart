import 'package:rite_funeral_flutter/imports.dart';

import '../../Buttons/custom_button.dart';
import 'Components/otp_fields.dart';
import 'update_password.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController pinCOde = TextEditingController();

  bool checkBox = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            48.y,
            const BackArrowWidget(),
            25.y,
            AppText(AppStrings.verifyOTP,
                style: Styles.bold(
                  color: AppColors.medium,
                  fontSize: 18.sp,
                )),
            5.y,
            AppText(AppStrings.enter4digit,
                style: Styles.medium(
                  color: AppColors.medium,
                  fontSize: 16.sp,
                )),
            const Spacer(),
            PinCodeFields(
              controller: pinCOde,
            ),
            5.y,
            Align(
              alignment: Alignment.centerRight,
              child: AppText('00:40',
                  style: Styles.medium(
                    color: AppColors.greyTextColor,
                    fontSize: 14.sp,
                  )),
            ),
            const Spacer(),
            CustomButton(
                onTap: () {
                  Navigate.to(context, const UpdatePassword());
                },
                text: AppStrings.submit),
            20.y,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText('Didn’t receive OTP?',
                    style: Styles.regular(
                      color: AppColors.medium,
                      fontSize: 16.sp,
                    )),
                AppText(' Resend',
                    style: Styles.bold(
                      color: AppColors.bold,
                      fontSize: 16.sp,
                    )),
              ],
            ),
            20.y,
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CustomTimePickerWithValidation extends StatefulWidget {
  // final String imageUrl;
  final String? validationText;
  final TextEditingController controller;

  final bool isBorderRequired;
  final bool isShadowRequired;
  final bool? isSuffix;
  final double rMargin;
  final double lMargin;
  final String? Function(String?)? validator;
  Widget? prefixIcon;
  Widget? suffixIcon;
  double? sHeight;
  double? sWidth;
  Color? fillColor;
  double? pHeight;
  double? pWidth;
  String? hintText;
  final double? width;

  final EdgeInsets? contentPadding;

  // final String? Function(String?)? validator;
  CustomTimePickerWithValidation(
      {super.key,
      // required this.text,
      // required this.imageUrl,
      // required this.dateTime,
      this.rMargin = 8,
      this.lMargin = 0,
      this.isBorderRequired = true,
      this.isShadowRequired = false,
      this.hintText,
      this.validator,
      this.width,
      this.isSuffix = false,
      this.validationText,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
        this.fillColor,
      this.sHeight,
      this.sWidth,
      this.pHeight,
      this.pWidth,
      this.contentPadding});

  @override
  State<CustomTimePickerWithValidation> createState() =>
      _CustomTimePickerWithValidationState();
}

class _CustomTimePickerWithValidationState
    extends State<CustomTimePickerWithValidation> {
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 60.h,
      width: widget.width ?? 0.40.sw,
      child: CustomTextFieldWithOnTap(
          filledColor: widget.fillColor?? AppColors.textFieldColor,
          lMargin: widget.lMargin,
          rMargin: widget.rMargin,
          // hintStyle: Styles.medium(
          //   fontWeight: FontWeight.w400,
          //   color: AppColors.light,
          //   fontSize: 14.sp,
          // ),
          height: 30.sp,
          borderColor: AppColors.greyTextColor,
          contentPadding: widget.contentPadding,
          validateText: widget.validationText ?? "Date Required",

          // isValid: false,

          readOnly: true,
          onTap: () async {
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: Colors.black12,
            ));
            SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
              statusBarColor: Colors.black12,
            ));
            var time = await pickTime(context);
            if (time == null) return;

            final newDateTime = DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              time.hour,
              time.minute,
            );

            setState(() {
              //  date = newDate;
              // widget.dateTime(newDate);
              widget.controller.text =
                  getHumanReadableDateAndTime(newDateTime.toString());
            });
          },
          hintStyle: Styles.medium(
            fontSize: 16.sp,
            color: AppColors.textFieldHint,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          isShadowRequired: widget.isShadowRequired,
          suffixHeight: widget.sHeight,
          suffixWidth: widget.sWidth,
          isValid: false,
          controller: widget.controller,
          isBorderRequired: widget.isBorderRequired,
          hintText: widget.hintText ?? "",
          validator: widget.validator,
          textInputType: TextInputType.text),
    );
  }

  // String getHumanReadableDateAndTime(String dt) {
  //   DateTime dateTime = DateTime.parse(dt);
  //   return intl.DateFormat('yyyy/MM/dd').format(dateTime);
  // }
  String getHumanReadableDateAndTime(String dt) {
    DateTime dateTime = DateTime.parse(dt);
    return intl.DateFormat('').add_jm().format(dateTime);
  }

  Future<TimeOfDay?> pickTime(BuildContext context) => showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary,
              ),
            ),
            child: child!,
          );
        },
      ).whenComplete(() {
        setState(() {
          SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ));
        });
      });
}

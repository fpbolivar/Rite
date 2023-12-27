import 'package:country_code_picker/country_code_picker.dart';
import 'package:rite_funeral_flutter/Data/AppData/data.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CountryPicker extends StatefulWidget {
  final TextEditingController controller;
  final bool onTapField;
  final bool isBorderRequired = true;
  final double? borderRadius;
  final Color? backGroundColor;
  final Color? borderColor;



  final String? Function(String?) countrySelect;
  final String? Function(String?)? validator;

  const CountryPicker(
      {super.key,
        required this.controller,
        required this.onTapField,
        required this.countrySelect,
        this.backGroundColor,
        this.borderRadius,
        this.borderColor,
        this.validator});

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  FocusNode focusNode = FocusNode();

  String code = '+1';

  @override
  void initState() {
    focusNode.unfocus();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (focusNode
    //       .hasFocus && widget.controller.text == '') {
    //     FocusScope.of(context).unfocus();
    //   }
    // });

    return TextFormField(
      keyboardType: TextInputType.phone,
      onFieldSubmitted: (value) {},
      // onTap: () {
      //   // widget.controller.text = code;
      // },
      style: Styles.regular(
          // color: FocusScope.of(context).hasFocus ? hintTextColor :AppColors.greyColor,
          fontSize: Data().textScale > 1.0 ? 16.sp : 16.sp,
          fontWeight: FontWeight.w400),
      validator: widget.validator,
      decoration: InputDecoration(
          fillColor: widget.backGroundColor?? AppColors.whiteColor,
          filled: true,
          hintText: 'Phone Number',
          prefixIcon: SizedBox(
            height: 45.h,
            width: 110.w,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: CountryCodePicker(
                    initialSelection: '+1',
                    onChanged: (value) {
                      code = value.dialCode ?? "";
                      widget.countrySelect(value.dialCode);
                      print(code);
                    },
                    textStyle: Styles.medium(
                      color: AppColors.greyTextColor,
                      fontSize: 12.sp,
                    ),
                    // onInit: (value) {
                    //   code = value!.dialCode ?? "";
                    //   setState(() {});
                    // },

                    // favorite: ['+221', 'SN'],
                    // dialogTextStyle: Styles.circularStdRegular(context,
                    //     color: FocusScope.of(context).hasFocus
                    //         ? AppColors.blackColor
                    //         : AppColors.blackColor,
                    //     fontSize: Data().textScale > 1.0 ? 12.sp : 14.sp,
                    //     fontWeight: FontWeight.w400),
                    // flagWidth: 20.sp,

                    // textStyle: Styles.circularStdRegular(context,
                    //     color: FocusScope
                    //         .of(context)
                    //         .hasFocus
                    //         ? AppColors.blackColor
                    //         : AppColors.blackColor,
                    //     fontSize: Data().textScale > 1.0 ? 12.sp : 14.sp,
                    //     fontWeight: FontWeight.w400),
                    showFlag: true,
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: Container(
                    margin: EdgeInsets.only(top: 8.sp, bottom: 8.sp),
                    child: const VerticalDivider(
                      thickness: 1,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          hintStyle: Styles.medium(
            color: AppColors.greyTextColor,
              // color: FocusScope.of(context).hasFocus ? hintTextColor :AppColors.greyColor,
              fontSize: Data().textScale > 1.0 ? 12.sp : 16.sp,
              fontWeight: FontWeight.w400),

          ///changess
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 8,
          ).r,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 12.r,
          ),
          borderSide: BorderSide(
            color:
            widget.isBorderRequired ? Colors.red : Colors.transparent,
          ),
        ),
        errorBorder: widget.isBorderRequired
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 12.r,
          ),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        )
            : outlineInputBorder(),
        border: widget.isBorderRequired
            ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 12.r,

            ),
            borderSide:  BorderSide(
                width: 1, color: widget.borderColor??AppColors.greyTextColor))
            : outlineInputBorder(),
        focusedBorder: widget.isBorderRequired
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 12.r,
          ),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        )
            : outlineInputBorder(),
        enabledBorder: widget.isBorderRequired
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 12.r,
          ),
          borderSide:  BorderSide(
            width: 0.30,
              color: widget.borderColor??AppColors.greyTextColor
          ),
        )
            : outlineInputBorder(),
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25 ?? 12.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}
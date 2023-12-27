import 'package:rite_funeral_flutter/Data/AppData/data.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CustomTextFieldWithOnTap extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? filledColor;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool isValid;
  final bool isBorderRequired;
  final String? titleText;
  final int? maxline;
  final TextStyle? hintStyle;
  final String? validateText;
  final bool? isShadowRequired;
  final Color? titleTextColor;
  final Color? borderColor;
  final double? suffixWidth;
  final double? suffixHeight;
  final ValueChanged? onChanged;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Color? hintTextColor;
  final double? height;
  final double? lMargin;
  final double? rMargin;
  final bool? isState;

  final EdgeInsets? contentPadding;

  const CustomTextFieldWithOnTap(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      required this.textInputType,
      this.suffixIcon,
      this.validator,
      this.prefixIcon,
      this.isValid = false,
      this.isBorderRequired = true,
      this.titleText = "",
      this.maxline = 1,
      this.validateText,
      this.isShadowRequired = false,
      this.titleTextColor = Colors.black,
      this.suffixWidth = 15,
      this.suffixHeight = 15,
      this.onChanged,
      this.contentPadding,
      this.onTap,
      this.readOnly,
      this.focusNode,
      this.hintTextColor,
      this.borderColor,
      this.borderRadius,
        this.lMargin,
        this.rMargin,
      this.height,
      this.filledColor,
      this.hintStyle,
      this.isState})
      : super(key: key);

  final double? borderRadius;

  @override
  State<CustomTextFieldWithOnTap> createState() =>
      _CustomTextFieldWithOnTapState();
}

bool isHide = true;

class _CustomTextFieldWithOnTapState extends State<CustomTextFieldWithOnTap> {
  @override
  Widget build(BuildContext context) {
    // print(Data().textScale);
    return Container(
      margin: EdgeInsets.only(left: widget.lMargin??0,right: widget.rMargin??0),
      padding: const EdgeInsets.symmetric(vertical: 8).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.titleText!.isNotEmpty
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3).r,
                      child: AppText(
                        widget.titleText!,
                        style: Styles.bold(
                          fontSize: 16.sp,
                          color: widget.titleTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.sp,
                    )
                  ],
                )
              : Container(),
          TextFormField(
            onTap: widget.onTap,
            readOnly: widget.readOnly ?? false,
            focusNode: widget.focusNode,

            //autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.isValid
                ? (v) {
                    if (v!.trim().isEmpty) {
                      return widget.validateText;
                    }
                    return null;
                  }
                : widget.validator,
            onChanged: widget.onChanged,
            keyboardType: widget.textInputType,
            obscureText: widget.isState != null ? isHide : widget.obscureText,
            controller: widget.controller,
            maxLines: widget.maxline,
            style: widget.hintStyle?? Styles.medium(
                fontSize: Data().textScale > 1.0 ? 12.sp : 16.sp,
                fontWeight: FontWeight.w400),
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              fillColor: widget.filledColor ?? AppColors.whiteColor,
              filled: true,
              hintText: widget.hintText,
              helperStyle: widget.hintStyle ?? Styles.regular(fontSize: 16),

              prefixIcon: widget.prefixIcon != null
                  ? SizedBox(
                      width: 15.w,
                      height: 15.w,
                      child: Center(
                        child: widget.prefixIcon,
                      ),
                    )
                  : null,
              suffixIcon: widget.isState != null
                  ? GestureDetector(
                      onTap: () {
                        //isHide=true;
                        if (isHide == true) {
                          isHide = false;
                        } else {
                          isHide = true;
                        }
                        setState(() {});
                      },
                      child: SizedBox(
                          width: widget.suffixWidth ?? 20.sp,
                          height: widget.suffixHeight ?? 20.sp,
                          child: Center(
                              child: SvgPicture.asset(isHide
                                  ? Assets.hidePassword
                                  : Assets.showPassword))))
                  : widget.suffixIcon != null
                      ? SizedBox(
                          width: widget.suffixWidth ?? 20.sp,
                          height: widget.suffixHeight ?? 20.sp,
                          child: Center(
                            child: widget.suffixIcon,
                          ),
                        )
                      : null,
              hintStyle: widget.hintStyle?? Styles.medium(
                color: FocusScope.of(context).hasFocus
                    ? AppColors.greyTextColor
                    : AppColors.bold,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),

              ///changess
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 17,
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
                      borderSide: BorderSide(
                          width: 0.60,
                          color: widget.borderColor ?? Colors.transparent))
                  : outlineInputBorder(),
              focusedBorder: widget.isBorderRequired
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? 12.r,
                      ),
                      borderSide: const BorderSide(
                        width: 0.40,
                        color: AppColors.primary,
                      ),
                    )
                  : outlineInputBorder(),
              enabledBorder: widget.isBorderRequired
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius ?? 12.r,
                      ),
                      borderSide: BorderSide(
                        width: 0.40,
                        color: widget.borderColor ?? AppColors.greyTextColor,
                      ),
                    )
                  : outlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
      borderSide: const BorderSide(color: Colors.transparent),
    );
  }
}

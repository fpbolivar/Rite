import 'package:rite_funeral_flutter/Data/AppData/data.dart';
import 'package:rite_funeral_flutter/imports.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController? controller;
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
  final double? suffixWidth;
  final double? suffixHeight;
  final ValueChanged? onChanged;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final FocusNode? focusNode;
  final Color? hintTextColor;
  final double? height;
  final bool? isState;

  final EdgeInsets? contentPadding;

  const SearchTextField(
      {Key? key,
         this.controller,
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
        this.borderRadius,
        this.height,
        this.filledColor,
        this.hintStyle,
        this.isState})
      : super(key: key);

  final double? borderRadius;

  @override
  State<SearchTextField> createState() =>
      _SearchTextFieldState();
}

bool isHide = false;

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    // print(Data().textScale);
    return Padding(
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
                  style: Styles.regular(
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
                    ? widget.hintTextColor
                    : AppColors.bold,
                fontSize:  16.sp,
                fontWeight: FontWeight.w400,
              ),

              ///changess
              contentPadding: widget.contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 17,
                  ).r,
              border: widget.isBorderRequired
                  ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 12.r,

                  ),
                  borderSide: const BorderSide(
                      width: 1, color: AppColors.borderColor))
                  : outlineInputBorder(),
              focusedBorder: widget.isBorderRequired
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 12.r,
                ),
                borderSide: const BorderSide(
                  color: AppColors.borderColor,
                  width: 0.30,
                ),
              )
                  : outlineInputBorder(),
              enabledBorder: widget.isBorderRequired
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 12.r,
                ),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: AppColors.borderColor,
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

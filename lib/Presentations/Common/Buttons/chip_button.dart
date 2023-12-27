import '../../../imports.dart';

class AppChip extends StatelessWidget {
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? txtColor;
  final String? txt;
  final double? h;
  final double? w;
  final Color? borderColor;
  final double? borderWidth;
  final double? radius;
  final double? fontSize;
  final String? fontFamily;
  final Widget? leftWidget;
  final Widget? rightWidget;

  final MainAxisAlignment? mainAxisAlignment;

  const AppChip(
      {super.key,
      this.borderColor,
      this.borderWidth,
      this.fontFamily,
      this.bgColor,
      this.txt,
      this.h,
      this.w,
      this.txtColor,
      this.radius,
      this.fontSize,
      this.leftWidget,
      this.rightWidget,
      this.mainAxisAlignment,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius ?? 30),
      child: Container(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 4, bottom: 4),
        height: h ?? 35,
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        // size1.longestSide * 0.07202928,
        width: w,
        decoration: BoxDecoration(
            color: bgColor ?? Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(radius ?? 30),
            border: Border.all(
              width: borderWidth == null ? 0 : borderWidth!,
              color: borderColor == null ? AppColors.primary : borderColor!,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          children: [
            leftWidget ?? 0.x,
            AppText(
              txt == null ? "Empty" : txt!,
              style: Styles.regular(color: txtColor ?? Colors.white),

              // AppStyles.regular(
              //     size: fontSize ?? CustomSize.convert(context, 16),
              //     color: txtColor ?? whiteColor),
            ),
            rightWidget ?? 0.x,
          ],
        ),
      ),
    );
  }
}

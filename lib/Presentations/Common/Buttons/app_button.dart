import 'package:rite_funeral_flutter/imports.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {this.onPressed,
      this.trailing,
      this.leading,
      this.borderColor,
      this.fontSize,
      this.height,
      this.radius,
      this.backgroundColor,
      this.textColor,
      this.title,
      this.width,
      super.key});
  final void Function()? onPressed;
  final String? title;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? radius;
  final double? width;
  final double? height;
  final double? fontSize;
  final Widget? leading;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? AppColors.primary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 12))),
          fixedSize: MaterialStateProperty.all(Size(
              width ?? (MediaQuery.sizeOf(context).width - 100), height ?? 55)),
          side: MaterialStateProperty.all(
              BorderSide(color: borderColor ?? AppColors.primary)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) leading!,
            AppText(title ?? "Button",
                style: Styles.medium(
                    fontSize: fontSize ?? 16,
                    color: textColor ?? Colors.white)),
            if (trailing != null) trailing!,
          ],
        ));
  }
}

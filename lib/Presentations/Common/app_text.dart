import 'package:rite_funeral_flutter/imports.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLine;
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.overflow,
    this.maxLine = 1,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      textScaler: TextScaler.noScaling,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: style ?? Styles.regular(),
    );
  }
}

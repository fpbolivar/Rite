
import 'package:rite_funeral_flutter/imports.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, this.textFirst, this.textSecond});

  final String? textFirst;
  final String? textSecond;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
        text: TextSpan(
            text: textFirst,
            style: Styles.bold(
              fontSize: 14.sp,
              color: AppColors.medium,
            ),
        children: [
            TextSpan(
            text: textSecond,
            style: Styles.bold(
              fontSize: 16.sp,
              color: AppColors.bold,
            ),),
        ]
        ),
    );
  }
}

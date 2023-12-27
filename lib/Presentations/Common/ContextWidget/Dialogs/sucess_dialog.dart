import 'package:rite_funeral_flutter/imports.dart';

class SuccessFulDialog {
  static Widget show(
      {required BuildContext context,
      required String? title,
      required String? message,
      double? height,
      double? width}) {
    return Container(
      height: height ?? 200.sp,
      width: width ?? 300.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        children: <Widget>[
         25.y,
          Center(
            child: SvgPicture.asset(
              Assets.success,
              height: 75.sp,
              width: 75.sp,
            ),
          ),
         15.y,
          Center(
              child: FittedBox(
                  child: AppText(
            title!,
            style: Styles.medium(fontSize: 16.sp),
          ))),
          5.y,
          AppText(
            message!,
            style: Styles.medium(fontSize: 12.sp,fontWeight: FontWeight.w400,color: AppColors.greyTextColor),
            maxLine: 3,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

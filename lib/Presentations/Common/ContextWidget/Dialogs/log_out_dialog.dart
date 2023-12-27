import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/imports.dart';

class LogOutDailog {
  static Widget show(
      {required BuildContext context,
        required String? title,
        required String? message,
        double? height,
        double? width}) {
    return Container(
      height: height ?? 180.sp,
      width: width ?? 300.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        children: <Widget>[
          25.y,
          Center(
              child: FittedBox(
                  child: AppText(
                    title!,
                    style: Styles.medium(fontSize: 16.sp),
                  ))),
          5.y,
          AppText(
            message!,
            style: Styles.medium(fontSize: 12.sp,fontWeight: FontWeight.w400),
            maxLine: 3,
            textAlign: TextAlign.center,
          ),
          20.y,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              5.x,
              SizedBox(
                width: 100.sp,
                child: InkWell(
                  onTap: () {
                    Navigate.pop(context);
                  },
                  child: AppText('Cancel',style: Styles.regular(
                    color: AppColors.greyTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              CustomButton(
                borderRadius: 13.sp,
                  width: 120.sp,
                  onTap: () {

              }, text: 'Confirm')
            ],
          )
        ],
      ),
    );
  }
}

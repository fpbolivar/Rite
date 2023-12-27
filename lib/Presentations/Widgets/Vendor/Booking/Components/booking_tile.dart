import 'package:rite_funeral_flutter/Presentations/Common/ContextWidget/Dialogs/custom_dialog.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Chat/chat.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Booking/Components/upcoming_booking_details.dart';
import 'package:rite_funeral_flutter/imports.dart';

class UpcomingTile extends StatelessWidget {
   UpcomingTile({super.key,this.showExtraRow});

  bool? showExtraRow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.to(context, const Details());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 15.sp),
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('Oliver Sterling',style: Styles.medium(
                  color: AppColors.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),),
                InkWell(
                  onTap: () {
                    CustomDialog.logout(context, title: 'Are you sure want to cancel ?', message: 'Are you sure to cancel this, rememberonce it delete then it won’t be recovered again');

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.sp,vertical: 5.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyTextColor),
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: Center(child: AppText('Cancel',style: Styles.regular(
                      color: AppColors.greyTextColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),),),
                  ),
                )
              ],
            ),
            5.y,
            Row(
              children: [
                SvgPicture.asset(Assets.calenderLight,height: 15.sp,width: 15.sp,),
                5.x,
                AppText('10 aug, 2023 - 10:00am to 02:00pm',style: Styles.regular(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),)
              ],
            ),
            8.y,
            Row(
              children: [
                SvgPicture.asset(Assets.location,height: 15.sp,width: 15.sp,),
                5.x,
                AppText('8898 Mayfield St.Bronx, NY 10461',style: Styles.regular(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),)
              ],
            ),
            8.y,
          showExtraRow != true?  10.x: Row(
              children: [
                SvgPicture.asset(Assets.invoice,height: 15.sp,width: 15.sp,),
                5.x,
                AppText('90q29ask',style: Styles.regular(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),)
              ],
            ),
            8.y,
            showExtraRow != true?  10.x:  Row(
              children: [
                AppText('\$',style: Styles.regular(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                ),),
                5.x,
                AppText('300',style: Styles.regular(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                ),)
              ],
            ),
            10.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('1\nMonths',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),),
                AppText('06\nDays',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                AppText('12\nHour',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),), AppText('45\nMinute',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                10.x,
                InkWell(
                  onTap: () {
                    Navigate.to(context, const ChatScreen());
                  },
                  child: Container(
                    height: 45.sp,
                    width: 45.sp,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: Center(child: SvgPicture.asset(Assets.chat,color: AppColors.whiteColor,),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

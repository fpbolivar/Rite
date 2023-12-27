import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Chat/chat.dart';
import 'package:rite_funeral_flutter/imports.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          'Funeral Venue',
          style: Styles.medium(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.y,
            AppText(
              'Oliver Sterling',
              style: Styles.medium(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
            10.y,
            CustomRow(
              title: 'Event type',
              subTitle: 'Funeral',
            ),
            10.y,
            CustomRow(
              title: 'Phone number',
              subTitle: '+1 760-753-7189',
            ),
            10.y,
            CustomRow(
              title: 'Date & time',
              subTitle: '10 aug, 2023 - 10:00am to 02:00pm',
            ),
            10.y,
            CustomRow(
              title: 'Location',
              subTitle: '44 East Tallwood DriveNew York, NY 10027',
            ),
            20.y,
            AppText(
              'Message',
              style: Styles.medium(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
              ),
            ),
            8.y,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: AppColors.textFieldColor
              ),
              child: AppText(
                'Lorem ipsum dolor sit amet consectetur. Dolor rhoncus diam ut non enim. Bibendum a mattis egestas odio mi scelerisque euismod integer eget. Ut enim amet elit nulla sed tellus lectus id scelerisque. ',
                maxLine: 6,
                style: Styles.regular(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.regular
                ),
              ),
            ),
            15.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                5.x,
                AppText('1\nMonths',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                AppText('06\nDays',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                AppText('12\nHour',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),), AppText('45\nMinute',
                  textAlign: TextAlign.center,
                  maxLine: 2,
                  style: Styles.medium(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),),
                5.x,
              ],
            ),
            200.y,
            CustomButton(onTap: () {
              Navigate.to(context, const ChatScreen());
            }, text: 'Chat')
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  CustomRow({super.key, this.title, this.subTitle});

  String? title;
  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title!,
          style: Styles.medium(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        AppText(
          subTitle!,
          style: Styles.medium(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

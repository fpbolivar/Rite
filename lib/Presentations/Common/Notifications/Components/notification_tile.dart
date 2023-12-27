import 'package:rite_funeral_flutter/Domain/Model/Notifications/notification_model.dart';
import 'package:rite_funeral_flutter/imports.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, this.data});

  final NotificationsModel? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate.to(
        //     context,
        //     ChatDetailsScreen(
        //       model: data,
        //     ));
      },
      child: Container(
        padding: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 60.sp,
                width: 60.sp,
                decoration: const BoxDecoration(
                  color: AppColors.textFieldColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: SvgPicture.asset(data!.pr0fileImage,
                        width: 40.sp, height: 40.sp))),
            15.x,
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText(data?.title ?? "",
                          style: Styles.bold(fontSize: 18.sp)),
                      const Spacer(),
                      AppText(data!.time,
                          style: Styles.regular(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyTextColor)),
                    ],
                  ),
                  5.y,
                  AppText(data!.subtitle,
                      maxLine: 1,
                      style: Styles.regular(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyTextColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

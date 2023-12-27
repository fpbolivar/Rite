import 'package:rite_funeral_flutter/Domain/Model/ChatModel/chat_tile_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Chat/chat_details.dart';
import 'package:rite_funeral_flutter/imports.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, this.data});

  final ChatTileModel? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.to(
            context,
            ChatDetailsScreen(
              model: data,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.greyTextColor, width: 0.2.sp)),
        child: Row(
          children: [
            AssetImageWidget(
              url: data!.pr0fileImage,
              isCircle: true,
              radius: 30.sp,
            ),
            // CacheImage(
            //     height: 50.h, width: 50.w, url: data!.pr0fileImage),
            15.x,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(data?.name ?? "",
                      style: Styles.bold(fontSize: 16.sp)),
                  2.y,
                  AppText(data?.title ?? "",
                      style: Styles.medium(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary)),
                  2.y,
                  AppText(data!.message,
                      style: Styles.light(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.greyTextColor)),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(data!.time,
                    style: Styles.light(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyTextColor)),
                20.y,
                data!.messageLength.isNotEmpty
                    ? CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 10.sp,
                        child: Center(
                          child: AppText(
                            data!.messageLength,
                            style: Styles.regular(
                                color: AppColors.whiteColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

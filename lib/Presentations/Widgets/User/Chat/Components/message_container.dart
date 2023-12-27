
import 'package:rite_funeral_flutter/Domain/Model/ChatModel/chat_message_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key, this.modelData});

  final ChatMessageModel? modelData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: modelData!.user == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(
                  right: modelData!.user == "receiver" ? 70.sp : 0,
                  left: modelData!.user == "sender" ? 70.sp : 0),
              padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
              decoration: BoxDecoration(
                borderRadius: modelData!.user == "receiver"
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp))
                    : BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp),
                        bottomLeft: Radius.circular(10.sp),
                      ),
                color: modelData!.user == "receiver"
                    ? AppColors.chatColor
                    : AppColors.primary,
              ),
              child:Text(modelData?.message ?? "",
                      textScaleFactor: 1,
                      style: Styles.regular(
                          color: modelData!.user == "receiver"
                              ? AppColors.bold
                              : AppColors.whiteColor)),
            ),
          ),
          8.y,
          Align(
            alignment: modelData!.user == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight,
            child: AppText('10:20 am',
                style: Styles.regular(
                    color: AppColors.greyTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}

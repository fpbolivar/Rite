import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/Domain/Model/ChatModel/chat_message_model.dart';
import 'package:rite_funeral_flutter/Domain/Model/ChatModel/chat_tile_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/back_arrow.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';

import 'package:rite_funeral_flutter/imports.dart';
import 'Components/message_container.dart';
import 'Components/pop_munu.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({super.key, this.model});

  final ChatTileModel? model;
  final TextEditingController message = TextEditingController();

  final List<ChatMessageModel> chats = [
    ChatMessageModel(user: 'receiver', time: '11:20 am', message: 'Hello'),
    ChatMessageModel(user: 'sender', time: '01:20 am', message: 'Hi'),
    ChatMessageModel(
        user: 'receiver',
        time: '02:21 am',
        message: 'I see your business in listing'),
    ChatMessageModel(
        user: 'sender',
        time: '03:30 pm',
        message: 'I wan to sell my business with more profit margin in it.'),
    ChatMessageModel(
        user: 'receiver',
        time: '02:20 pm',
        message: 'I would love to get more info about this'),
    ChatMessageModel(
        user: 'sender',
        time: '04:20 am',
        message: 'business portfolio.pdf',
        file: 'assets/images/pdf_icon.png'),
    ChatMessageModel(user: 'receiver', time: '04:20 am', message: 'Thank You'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Stack(
          children: [
            Column(
              children: [
                16.y,
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.sp),
                      child: Row(
                        children: [
                          const BackArrowWidget(),
                          10.x,
                          AssetImageWidget(
                              height: 50.h,
                              width: 50.w,
                              url: model!.pr0fileImage),
                          10.x,
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AppText(model!.name,
                                    style: Styles.bold(
                                      fontSize: 18.sp,
                                    )),
                                AppText(
                                  model!.title,
                                  maxLine: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.regular(
                                    fontSize: 12.sp,
                                    color: AppColors.regular,
                                  ),
                                ),
                                // AppText('Online',
                                //     style: Styles.regular(
                                //         fontSize: 12.sp,
                                //         color: AppColors.regular)),
                              ],
                            ),
                          ),
                          SvgPicture.asset(Assets.call),
                          10.x,
                          //const Spacer(),
                          const PopMenu(),

                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.greyTextColor,
                      thickness: 1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.sp,vertical: 10.sp),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: AppText(
                                AppStrings.markIsRead,
                                style: Styles.bold(
                                  color: AppColors.primary,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              color: AppColors.greyTextColor,
                              thickness: 1,

                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: AppText(
                                  AppStrings.discard,
                                  style: Styles.bold(
                                    color: AppColors.greyTextColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: AppColors.greyTextColor,
                      thickness: 1,
                    ),
                  ],
                ),
                5.y,
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Chip(
                            labelPadding: EdgeInsets.symmetric(
                                horizontal: 5.sp, vertical: 2.sp),
                            side: const BorderSide(color: AppColors.whiteColor),
                            backgroundColor: AppColors.textFieldColor,
                            label: AppText(
                              '16 May, 2023',
                              style: Styles.regular(),
                            )),
                        20.y,
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 24.sp),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return MessageContainer(
                                modelData: chats[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15.sp,
                              );
                            },
                            itemCount: chats.length),
                        75.y,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -5,
              child: SizedBox(
                height: 80.h,
                width: 1.sw,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomTextFieldWithOnTap(
                    isBorderRequired: true,
                      prefixIcon: SvgPicture.asset('assets/icons/attach.svg'),
                      suffixIcon: Container(
                          margin: EdgeInsets.only(right: 10.sp),
                          child: SvgPicture.asset('assets/icons/send.svg')),
                      borderRadius: 40.sp,
                      controller: message,
                      hintText: 'Message',
                      textInputType: TextInputType.text),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

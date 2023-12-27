import 'package:rite_funeral_flutter/Domain/Model/ChatModel/chat_tile_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/search_text_fields.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'Components/chat_tile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    this.backButton,
    super.key,
  });

  final bool? backButton;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  int chip = 0;

  List<ChatTileModel> chatData = [

    ChatTileModel(
        message: 'Aqib Javid',
        messageLength: '',
        title: 'Women Fashion',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/chat3.png',
        time: '04:30 am'),
    ChatTileModel(
        message: 'Aqib Javid',
        messageLength: '',
        title: 'Women Fashion',
        name: 'Gabriel Tasse',
        pr0fileImage: 'assets/images/chat3.png',
        time: '04:30 am'),
    ChatTileModel(
        message: 'Hello How Are Your',
        messageLength: '3',
        title: 'Drop shipping and e-commerce website',
        name: 'Elizabeth',
        pr0fileImage: 'assets/images/chat2.png',
        time: '05:30 pm'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar(
        //   title: 'Chat',
        //   leading: widget.backButton,
        // ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            children: [
              25.y,
              Align(
                alignment: Alignment.center,
                child: AppText('Chat', style: Styles.bold(fontSize: 18.sp)),
              ),
              10.y,
              SearchTextField(
                  filledColor: AppColors.textFieldColor,
                  prefixIcon: SvgPicture.asset(Assets.search),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
                  borderRadius: 40,
                  controller: controller,
                  hintTextColor: AppColors.textFieldHint,
                  hintText: AppStrings.chatSearch,
                  textInputType: TextInputType.text),
              10.y,
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 15.h,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    return ChatTile(
                      data: chatData[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

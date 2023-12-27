import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';
import 'package:share_plus/share_plus.dart';

class InviteGuests extends StatefulWidget {
  const InviteGuests({super.key});

  @override
  State<InviteGuests> createState() => _InviteGuestsState();
}

class _InviteGuestsState extends State<InviteGuests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black87,
        ),
        title:  AppText("Guest list",style: Styles.medium(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            20.y,
            AppText(
              "Let’s add some friends to your guest list!",
              style: Styles.medium(fontSize: 16),
            ),
            AppText(
              "Easily add and organise your guest for your \nFuneral event!",
              maxLine: 3,
              style: Styles.regular(fontSize: 16,fontWeight: FontWeight.w400),
            ),
            60.y,
            CustomTextFieldWithOnTap(
                prefixIcon:  SvgPicture.asset(Assets.calling),
                controller: TextEditingController(),
                hintText: "Import from contacts",
                textInputType: TextInputType.text),
            10.y,
            CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.person),
                controller: TextEditingController(),
                hintText: "Enter guest manually",
                textInputType: TextInputType.text),
            40.y,
            Align(
              alignment: Alignment.center,
              child: AppText(
                "Or share",
                style: Styles.regular(fontSize: 20),
              ),
            ),
            40.y,
            AppButton(
              onPressed: () async {
                await Share.share('Share Invitation Link',
                    subject: 'The soul is on the way to heaven.');
              },
              title: "Share Link",
            )
          ],
        ),
      ),
    );
  }
}

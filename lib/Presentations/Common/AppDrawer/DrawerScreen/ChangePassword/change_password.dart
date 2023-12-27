import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../../Buttons/custom_button.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPassword = TextEditingController();

  final TextEditingController newPassword = TextEditingController();

  final TextEditingController confirmNewPassword = TextEditingController();

  @override
  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: AppText(
          AppStrings.changePassword,
          style: Styles.medium(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            5.y,
            CustomTextFieldWithOnTap(
              titleText: "Old Password",
              titleTextColor: AppColors.bold,
              isState: true,
              prefixIcon: SvgPicture.asset(Assets.lock),
              hintTextColor: AppColors.textFieldHint,
              controller: oldPassword,
              hintText: 'Old Password',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            30.y,
            CustomTextFieldWithOnTap(
              titleText: "New Password",
              titleTextColor: AppColors.bold,
              isState: true,
              prefixIcon: SvgPicture.asset(Assets.lock),
              hintTextColor: AppColors.textFieldHint,
              controller: newPassword,
              hintText: 'New Password',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              isState: true,
              prefixIcon: SvgPicture.asset(Assets.lock),
              hintTextColor: AppColors.textFieldHint,
              controller: confirmNewPassword,
              hintText: 'Confirm Password',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            130.y,
            CustomButton(onTap: () {}, text: AppStrings.submit)
          ],
        ),
      ),
    );
  }
}

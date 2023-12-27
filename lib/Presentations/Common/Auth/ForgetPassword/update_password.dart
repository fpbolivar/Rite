import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../Buttons/custom_button.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool checkBox = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            48.y,
            const BackArrowWidget(),
            25.y,
            AppText(AppStrings.updatePassword,
                style: Styles.bold(
                  color: AppColors.medium,
                  fontSize: 18.sp,
                )),
            5.y,
            AppText(AppStrings.enterPassword,
                style: Styles.medium(
                  color: AppColors.medium,
                  fontSize: 16.sp,
                )),
            const Spacer(),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.lock),
              hintTextColor: AppColors.textFieldHint,
              controller: password,
              hintText: 'Password',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            10.y,
            CustomTextFieldWithOnTap(
              isState: true,
              prefixIcon: SvgPicture.asset(Assets.lock),
              hintTextColor: AppColors.textFieldHint,
              controller: confirmPassword,
              hintText: 'Confirm Password',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            const Spacer(),
            CustomButton(onTap: () {}, text:'Update'),
            70.y,
          ],
        ),
      ),
    );
  }
}

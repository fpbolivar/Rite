import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/Components/google_maps.dart';
import 'package:rite_funeral_flutter/imports.dart';

class SocailLinks extends StatelessWidget {
  SocailLinks({super.key});


  TextEditingController facebook = TextEditingController();
  TextEditingController twiter = TextEditingController();

  TextEditingController insta = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  CustomButton(
          horizontalMargin: 20.sp,
          verticalMargin: 20.sp,
          onTap: () {

      }, text: 'Save'),
      appBar: CrossButtonAppBar(
        title: AppStrings.socailLink,
        onClose: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.twwiter),
              hintTextColor: AppColors.textFieldHint,
              controller: twiter,
              hintText: 'Twitter Account',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.facebook),
              hintTextColor: AppColors.textFieldHint,
              controller: facebook,
              hintText: 'Facebook Account',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.insa),
              hintTextColor: AppColors.textFieldHint,
              controller: insta,
              hintText: 'Instagram Account',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
          ],
        ),
      ),
    );
  }
}

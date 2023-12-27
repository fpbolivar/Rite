import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/custom_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/country_picker.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddBusinessDetails extends StatelessWidget {
   AddBusinessDetails({super.key});

  TextEditingController name =  TextEditingController();
  TextEditingController email =  TextEditingController();
   TextEditingController description =  TextEditingController();
   TextEditingController site =  TextEditingController();
   TextEditingController phone =  TextEditingController();




   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CrossButtonAppBar(
        title: AppStrings.priceServices,
        onClose: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            10.y,
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.person),
              hintTextColor: AppColors.textFieldHint,
              controller: name,
              hintText: 'Epcistudio',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              maxline: 5,
              hintTextColor: AppColors.textFieldHint,
              controller: description,
              hintText: 'Describe your business',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.email),
              hintTextColor: AppColors.textFieldHint,
              controller: email,
              hintText: 'kevinsmithofficial@gmail.com',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CountryPicker(

              controller: phone,
              backGroundColor: AppColors.textFieldColor,
              onTapField: false,
              countrySelect: (value) {},
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.ball),
              hintTextColor: AppColors.textFieldHint,
              controller: site,
              hintText: 'ritefunel.site.com',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            120.y,
            CustomButton(onTap: () {

            }, text: 'Save')
          ],
        ),
      ),
    );
  }
}

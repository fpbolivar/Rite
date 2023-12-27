import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/Components/google_maps.dart';
import 'package:rite_funeral_flutter/imports.dart';

class LocationAndMap extends StatelessWidget {
   LocationAndMap({super.key});


  TextEditingController postCode = TextEditingController();
  TextEditingController country = TextEditingController();

  TextEditingController town = TextEditingController();
  TextEditingController address = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CrossButtonAppBar(
        title: AppStrings.locationOnMap,
        onClose: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.location),
              hintTextColor: AppColors.textFieldHint,
              controller: postCode,
              hintText: 'Post Code',
              textInputType: TextInputType.number,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.location),
              hintTextColor: AppColors.textFieldHint,
              controller: town,
              hintText: 'Town/City',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.location),
              hintTextColor: AppColors.textFieldHint,
              controller: country,
              hintText: 'Country',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.location),
              hintTextColor: AppColors.textFieldHint,
              controller: address,
              hintText: 'Address',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            10.y,
            SizedBox(
              height: 150.h,width: 1.sw,
                child: const GoogleMps()),
            100.y,
            CustomButton(onTap: () {

            }, text: 'Save')
          ],
        ),
      ),
    );
  }
}

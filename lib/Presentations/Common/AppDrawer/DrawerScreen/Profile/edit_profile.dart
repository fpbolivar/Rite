import 'dart:io';

import 'package:rite_funeral_flutter/Applications/Services/PickerServices/picker_services.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/country_picker.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? image;

  TextEditingController firstName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainWidget(
      title: AppStrings.editProfile,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            10.y,
            Stack(
              children: [
                if (image == null)
                  const AssetImageWidget(
                    url: Assets.chat1,
                    radius: 60,
                    isCircle: true,
                  )
                else
                  CircleAvatar(
                      radius: 55.sp, backgroundImage: FileImage(File(image!))),
                Positioned(
                    top: 80.sp,
                    left: 75.sp,
                    child: SvgPicture.asset(Assets.greenElipse)),
                Positioned(
                    top: 87.sp,
                    left: 83.sp,
                    child: InkWell(
                        onTap: () async {
                          image = await PickFile.pickSingleImage();
                          setState(() {});
                        },
                        child: SvgPicture.asset(Assets.edit))),
              ],
            ),
            10.y,
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.person),
              hintTextColor: AppColors.textFieldHint,
              controller: firstName,
              hintText: 'First Name',
              textInputType: TextInputType.text,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.person),
              hintTextColor: AppColors.textFieldHint,
              controller: lastName,
              hintText: 'Last Name',
              textInputType: TextInputType.text,
            ),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.email),
              hintTextColor: AppColors.textFieldHint,
              controller: email,
              hintText: 'Email',
              textInputType: TextInputType.text,
            ),
            CountryPicker(
              borderColor: AppColors.greyTextColor,
              controller: phone,
              onTapField: false,
              countrySelect: (value) {},
            ),
            160.y,
            CustomButton(onTap: () {}, text: AppStrings.update)
          ],
        ),
      ),
    );
  }
}

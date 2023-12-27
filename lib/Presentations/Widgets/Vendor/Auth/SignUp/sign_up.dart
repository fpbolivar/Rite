import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/country_picker.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/richText.dart';
import 'package:rite_funeral_flutter/imports.dart';

class VendorSignUp extends StatefulWidget {
  const VendorSignUp({super.key});

  @override
  State<VendorSignUp> createState() => _VendorSignUpState();
}

class _VendorSignUpState extends State<VendorSignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController businessName = TextEditingController();
  TextEditingController userName = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController postTown = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool checkBox = true;

  String? cat;

  List<String> catagoury = ['Flowers ', 'Transport', 'Cooking'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              48.y,
              const BackArrowWidget(),
              25.y,
              AppText('Create an account',
                  style: Styles.bold(
                    color: AppColors.medium,
                    fontSize: 18.sp,
                  )),
              5.y,
              AppText('Enter details to become vendor on our platform',
                  style: Styles.medium(
                    color: AppColors.medium,
                    fontSize: 14.sp,
                  )),
              20.y,
              CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.person),
                hintTextColor: AppColors.textFieldHint,
                controller: businessName,
                hintText: 'Business Name',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
              CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.person),
                hintTextColor: AppColors.textFieldHint,
                controller: postTown,
                hintText: 'Town/city',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
              CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.email),
                hintTextColor: AppColors.textFieldHint,
                controller: emailController,
                hintText: 'Email',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
              5.y,
              CustomDropDownWidget(
                  filledColor: AppColors.textFieldColor,
                  prefixIcon: SvgPicture.asset(Assets.category),
                  hintText: 'Select type',
                  value: cat,
                  validationText: '',
                  onChanged: (value) {},
                  itemsMap: catagoury.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList()),
              10.y,
              CustomDropDownWidget(
                  filledColor: AppColors.textFieldColor,
                  prefixIcon: SvgPicture.asset(Assets.category),
                  hintText: 'Main business',
                  value: cat,
                  validationText: '',
                  onChanged: (value) {},
                  itemsMap: catagoury.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList()),
              10.y,
              CountryPicker(
                controller: phone,
                backGroundColor: AppColors.textFieldColor,
                onTapField: false,
                countrySelect: (value) {},
              ),
              10.y,
              CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.person),
                hintTextColor: AppColors.textFieldHint,
                controller: userName,
                hintText: 'User Name',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
              10.y,
              CustomTextFieldWithOnTap(
                isState: true,
                prefixIcon: SvgPicture.asset(Assets.lock),
                hintTextColor: AppColors.textFieldHint,
                controller: passwordController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
              5.y,
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Checkbox(
                      splashRadius: 20.sp,
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                      activeColor: AppColors.whiteColor,
                      fillColor:
                          const MaterialStatePropertyAll(AppColors.primary),
                      value: checkBox,
                      onChanged: (value) {},
                    ),
                  ),
                  AppText(AppStrings.agreeTo,
                      style: Styles.medium(
                        color: AppColors.textFieldHint,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              15.y,
              CustomButton(onTap: () {}, text: 'Create Account'),

              20.y,
              // AppText(AppStrings.noHaveAccount,
              //     style: Styles.medium(
              //       color: AppColors.greyTextColor,
              //       fontSize: 14.sp,
              //       fontWeight: FontWeight.normal,
              //     )),
            ],
          ),
        ),
      ),
    );
  }
}

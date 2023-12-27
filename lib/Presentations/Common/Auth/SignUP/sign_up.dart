import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/country_picker.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/richText.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../Buttons/custom_button.dart';
import '../Login/Components/socail_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool checkBox = true;

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
              AppText(AppStrings.hello,
                  style: Styles.bold(
                    color: AppColors.medium,
                    fontSize: 18.sp,
                  )),
              5.y,
              AppText(AppStrings.enterDetails,
                  style: Styles.medium(
                    color: AppColors.medium,
                    fontSize: 16.sp,
                  )),
              20.y,
              CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.person),
                hintTextColor: AppColors.textFieldHint,
                controller: firstName,
                hintText: 'First Name',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
              CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.email),
                hintTextColor: AppColors.textFieldHint,
                controller: lastName,
                hintText: 'Last Name',
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
              10.y,
              CountryPicker(
                controller: phone,
                onTapField: false,
                backGroundColor: AppColors.textFieldColor,
                countrySelect: (value) {},
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
              CustomButton(onTap: () {}, text: AppStrings.signUp),
              25.y,
              const Align(
                alignment: Alignment.center,
                child: RichTextWidget(
                  textFirst: AppStrings.alerdyHaveAccount,
                  textSecond: AppStrings.login,
                ),
              ),
              20.y,
              Align(
                alignment: Alignment.center,
                child: AppText(AppStrings.orLogin,
                    style: Styles.medium(
                      color: AppColors.greyTextColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              25.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SocialButton(
                    assets: Assets.google,
                  ),
                  18.x,
                  const SocialButton(
                    assets: Assets.facebook,
                  ),
                  18.x,
                  const SocialButton(
                    assets: Assets.apple,
                  ),
                ],
              ),
              25.y,
              const Align(
                alignment: Alignment.center,
                child: RichTextWidget(
                  textFirst: AppStrings.areYouVan,
                  textSecond: AppStrings.bussSignIn,
                ),
              ),

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

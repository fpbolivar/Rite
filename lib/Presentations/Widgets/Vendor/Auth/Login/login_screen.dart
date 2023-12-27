import 'package:rite_funeral_flutter/Presentations/Common/Auth/ForgetPassword/verify_email.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/richText.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Auth/SignUp/sign_up.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/BottomBar/bottom_bar.dart';

import 'package:rite_funeral_flutter/imports.dart';



class VendorLogin extends StatefulWidget {
  const VendorLogin({super.key});

  @override
  State<VendorLogin> createState() => _VendorLoginState();
}

class _VendorLoginState extends State<VendorLogin> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
              45.y,
              AppText(AppStrings.growYourBusiness,
                  style: Styles.bold(
                    color: AppColors.medium,
                    fontSize: 18.sp,
                  )),
              5.y,
              AppText(AppStrings.enterDetailsTo,
                  style: Styles.medium(
                    color: AppColors.medium,
                    fontSize: 16.sp,
                  )),
              90.y,
              CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.email),
                hintTextColor: AppColors.textFieldHint,
                controller: emailController,
                hintText: 'Email',
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
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigate.to(context, const VerifyEmail());
                  },
                  child: AppText(AppStrings.forgetPassword,
                      style: Styles.medium(
                        color: AppColors.greyTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ),
              25.y,
              CustomButton(
                  onTap: () {
                    Navigate.to(context, const VendorBottomBar());
                  },
                  text: AppStrings.login),
              25.y,
              // Align(
              //   alignment: Alignment.center,
              //   child: InkWell(
              //     onTap: () {
              //       Navigate.to(context, const SignUp());
              //     },
              //     child: const RichTextWidget(
              //       textFirst: AppStrings.noHaveAccount,
              //       textSecond: AppStrings.signUp,
              //     ),
              //   ),
              // ),
              // 20.y,
              // Align(
              //   alignment: Alignment.center,
              //   child: AppText(AppStrings.orLogin,
              //       style: Styles.medium(
              //         color: AppColors.greyTextColor,
              //         fontSize: 14.sp,
              //         fontWeight: FontWeight.w400,
              //       )),
              // ),
              // 25.y,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const SocialButton(
              //       assets: Assets.google,
              //     ),
              //     18.x,
              //     const SocialButton(
              //       assets: Assets.facebook,
              //     ),
              //     18.x,
              //     const SocialButton(
              //       assets: Assets.apple,
              //     ),
              //   ],
              // ),
              195.y,
               Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigate.to(context, const VendorSignUp());
                  },
                  child: const RichTextWidget(
                    textFirst: 'Are you venue or vendor?',
                    textSecond: " Create account",
                  ),
                ),
              ),

              10.y,
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

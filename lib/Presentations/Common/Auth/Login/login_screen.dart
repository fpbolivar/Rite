import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/richText.dart';
import 'package:rite_funeral_flutter/frame.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../../Widgets/User/Home/home.dart';
import '../../Buttons/custom_button.dart';
import '../ForgetPassword/verify_email.dart';
import '../SignUP/sign_up.dart';
import 'Components/socail_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              48.y,
              const BackArrowWidget(),
              25.y,
              AppText(AppStrings.hello,
                  style: Styles.bold(
                    color: AppColors.medium,
                    fontSize: 18.sp,
                  )),
              5.y,
              AppText(AppStrings.enterEmailAndPassword,
                  maxLine: 2,
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
                  AppText(AppStrings.rememberMe,
                      style: Styles.medium(
                        color: AppColors.textFieldHint,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      )),
                  const Spacer(),
                  InkWell(
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
                ],
              ),
              15.y,
              CustomButton(
                  onTap: () {
                    Navigate.to(context, const Frame());
                  },
                  text: AppStrings.login),
              25.y,
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigate.to(context, const SignUp());
                  },
                  child: const RichTextWidget(
                    textFirst: AppStrings.noHaveAccount,
                    textSecond: AppStrings.signUp,
                  ),
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

import 'package:rite_funeral_flutter/Presentations/Common/Auth/ForgetPassword/verify_otp.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';


class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool checkBox = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            48.y,
            const BackArrowWidget(),
            25.y,
            AppText(AppStrings.forgetPass,
                style: Styles.bold(
                  color: AppColors.medium,
                  fontSize: 18.sp,
                )),
            5.y,
            Expanded(
              child: AppText(AppStrings.enterEmailToForgetPassword,
                  style: Styles.medium(
                    color: AppColors.medium,
                    fontSize: 16.sp,
                  )),
            ),
            Expanded(
              child: CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.email),
                hintTextColor: AppColors.textFieldHint,
                controller: emailController,
                hintText: 'Email',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
            ),
            50.y,
            CustomButton(
                onTap: () {
                  Navigate.to(context, const VerifyOtp());
                },
                text: AppStrings.submit),
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
    );
  }
}

import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../../Buttons/custom_button.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  String? image;

  TextEditingController firstName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController issue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        centerTitle: true,
        title: AppText(AppStrings.customerSupport,style: Styles.medium(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
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
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.calling),
              hintTextColor: AppColors.textFieldHint,
              controller: phone,
              hintText: 'Phone Number',
              textInputType: TextInputType.text,
            ),
            CustomTextFieldWithOnTap(
              height: 80.sp,
              maxline: 4,
              hintTextColor: AppColors.textFieldHint,
              controller: issue,
              hintText: 'Write About Issue',
              textInputType: TextInputType.text,
            ),
            160.y,
            CustomButton(onTap: () {}, text: AppStrings.submit)
          ],
        ),
      ),
    );
  }
}

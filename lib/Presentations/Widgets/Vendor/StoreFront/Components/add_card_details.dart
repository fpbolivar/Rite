import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddCardDetails extends StatelessWidget {
   AddCardDetails({super.key});

  final TextEditingController cardHolderName = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
   final TextEditingController password = TextEditingController();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CrossButtonAppBar(
        title: AppStrings.boostBusiness,
        onClose: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText('Add your card information',
                style: Styles.bold(
                  color: AppColors.bold,
                  fontSize: 16.sp,
                )),
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.card),
              hintTextColor: AppColors.textFieldHint,
              controller: cardHolderName,
              hintText: 'Card Holder Name',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            5.y,
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.person),
              hintTextColor: AppColors.textFieldHint,
              controller: cardNumber,
              hintText: 'Card Number',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            5.y,
            Row(
              children: [
                Expanded(
                  child: CustomTextFieldWithOnTap(
                    hintStyle: Styles.medium(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyTextColor
                    ),
                    prefixIcon: SvgPicture.asset(Assets.calenderLight),
                    hintTextColor: AppColors.textFieldHint,
                    controller: cardHolderName,
                    hintText: 'MM/YY',
                    textInputType: TextInputType.text,
                    filledColor: AppColors.textFieldColor,
                  ),
                ),
                10.x,
                Expanded(
                  child: CustomTextFieldWithOnTap(
                    hintStyle: Styles.medium(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyTextColor
                    ),
                    isState: true,
                    prefixIcon: SvgPicture.asset(Assets.lock),
                    hintTextColor: AppColors.textFieldHint,
                    controller: password,
                    hintText: 'Password',
                    textInputType: TextInputType.text,
                    filledColor: AppColors.textFieldColor,
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}

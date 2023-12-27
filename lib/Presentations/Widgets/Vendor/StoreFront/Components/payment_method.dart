import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/SetPaymentMethod/Components/payment_method_tile.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';


class VendorPayment extends StatefulWidget {
  const VendorPayment({super.key});

  @override
  State<VendorPayment> createState() => _VendorPaymentState();
}

class _VendorPaymentState extends State<VendorPayment> {
  Map<int, bool> indexBool = {0: true, 1: false};

  final TextEditingController cardHolderName = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MainWidget(
      title: AppStrings.setPayment,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            20.y,
            PaymentMethodTile(
              title: ' / User Name',
              image: Assets.payPal,
              index: indexBool[0],
              onTap: () {
                if (indexBool[0] == false) {
                  indexBool = {0: true, 1: false};
                  setState(() {});
                }
              },
            ),
            10.y,
            PaymentMethodTile(
              title: 'Card number',
              image: Assets.card,
              //priIndex: priInd??0,
              index: indexBool[1],

              onTap: () {
                if (indexBool[1] == false) {
                  indexBool = {0: false, 1: true};
                  setState(() {});
                }
              },
            ),
            15.y,
            indexBool[1] == true
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText('Add new card',
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
                        prefixIcon: SvgPicture.asset(Assets.calender),
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
                        isState: true,
                        prefixIcon: SvgPicture.asset(Assets.lock),
                        hintTextColor: AppColors.textFieldHint,
                        controller: cardNumber,
                        hintText: 'Password',
                        textInputType: TextInputType.text,
                        filledColor: AppColors.textFieldColor,
                      ),
                    ),
                  ],
                )
              ],
            )
                : const SizedBox(),
            indexBool[1] == true ? 130.y : 230.y,
            CustomButton(onTap: () {}, text: AppStrings.addCard),
            20.y,
          ],
        ),
      ),
    );
  }
}

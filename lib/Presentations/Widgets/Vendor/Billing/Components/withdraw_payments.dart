import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/SetPaymentMethod/Components/payment_method_tile.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/ContextWidget/Dialogs/custom_dialog.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class WithDrawPayments extends StatefulWidget {
  const WithDrawPayments({super.key});

  @override
  State<WithDrawPayments> createState() => _WithDrawPaymentsState();
}

class _WithDrawPaymentsState extends State<WithDrawPayments> {
  Map<int, bool> indexBool = {0: true, 1: false};

  final TextEditingController cardHolderName = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController bankName = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController account = TextEditingController();

  final TextEditingController routing = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CrossButtonAppBar(
          title: 'Payment Withdrawal',
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.sp),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              20.y,
              PaymentMethodTile(
                title: 'Add Bank information',
                image: Assets.bank,
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
                title: 'Add credit / debit card',
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
              indexBool[1] == true ? cardWidget() : bankAccount(),
              50.y,
              CustomButton(
                  onTap: () {
                    CustomDialog.successDialog(context,
                        title: 'Withdraw successfully',
                        message:
                            'You’ve successfully withdraw your payment it will take 2 business days to your account');
                  },
                  text: 'Withdraw payment'),
              20.y,
            ],
          ),
        ));
  }

  cardWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('Add your card',
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
                controller: amount,
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
                controller: routing,
                hintText: 'Password',
                textInputType: TextInputType.text,
                filledColor: AppColors.textFieldColor,
              ),
            ),
          ],
        )
      ],
    );
  }

  bankAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText('Add Bank information',
            style: Styles.bold(
              color: AppColors.bold,
              fontSize: 16.sp,
            )),
        CustomTextFieldWithOnTap(
          prefixIcon: SvgPicture.asset(Assets.card),
          hintTextColor: AppColors.textFieldHint,
          controller: bankName,
          hintText: 'Bank Name',
          textInputType: TextInputType.text,
          filledColor: AppColors.textFieldColor,
        ),
        5.y,
        CustomTextFieldWithOnTap(
          prefixIcon: SvgPicture.asset(Assets.person),
          hintTextColor: AppColors.textFieldHint,
          controller: cardHolderName,
          hintText: 'Account holder name',
          textInputType: TextInputType.text,
          filledColor: AppColors.textFieldColor,
        ),
        CustomTextFieldWithOnTap(
          prefixIcon: SvgPicture.asset(Assets.bank),
          hintTextColor: AppColors.textFieldHint,
          controller: account,
          hintText: 'Account Number',
          textInputType: TextInputType.text,
          filledColor: AppColors.textFieldColor,
        ),
        CustomTextFieldWithOnTap(
          prefixIcon: SvgPicture.asset(Assets.routing),
          hintTextColor: AppColors.textFieldHint,
          controller: routing,
          hintText: 'Routing Number',
          textInputType: TextInputType.text,
          filledColor: AppColors.textFieldColor,
        ),
        CustomTextFieldWithOnTap(
          prefixIcon: SvgPicture.asset(Assets.dollar),
          hintTextColor: AppColors.textFieldHint,
          controller: amount,
          hintText: 'Add amount',
          textInputType: TextInputType.text,
          filledColor: AppColors.textFieldColor,
        ),
        5.y,
      ],
    );
  }
}

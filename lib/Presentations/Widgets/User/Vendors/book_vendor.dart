import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/SetPaymentMethod/Components/payment_method_tile.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Calender/calander.dart';
import 'package:rite_funeral_flutter/Presentations/Common/ContextWidget/Dialogs/custom_dialog.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/country_picker.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TimerPicker/custom_time_picker.dart';
import 'package:rite_funeral_flutter/imports.dart';

class BookVendor extends StatelessWidget {
  BookVendor({super.key});

  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();

  ValueNotifier<Map<int, bool>> payment = ValueNotifier({0: false, 1: false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Expanded(child: BackArrowWidget()),
            AppText('Funeral Venue',
                style: Styles.medium(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: AppColors.medium,
                )),
            const Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.y,
              AppText('Send request for book the venue',
                  style: Styles.regular(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: AppColors.medium,
                  )),
              10.y,
              const RangePicker(
                ignoreDates: [],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 7.sp,
                    width: 7.sp,
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  AppText('. Booked',
                      style: Styles.regular(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.light,
                      )),
                ],
              ),
              10.y,
              Row(
                children: [
                  Expanded(
                      child: AppText(
                    ' Start',
                    style: Styles.medium(
                      color: AppColors.medium,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                 35.x,
                  Expanded(
                      child: AppText(
                    ' End',
                    style: Styles.medium(
                      color: AppColors.medium,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTimePickerWithValidation(
                      fillColor: AppColors.whiteColor,
                      rMargin: 15.sp,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 5.sp),
                      controller: startTime,
                      validator: (p0) {},
                      hintText: 'Start Time',
                    ),
                  ),
                  35.x,
                  Expanded(
                    child: CustomTimePickerWithValidation(
                      fillColor: AppColors.whiteColor,
                      rMargin: 15.sp,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 5.sp),
                      controller: endTime,
                      validator: (p0) {},
                      hintText: 'End Time',
                    ),
                  ),
                ],
              ),
              CustomTextFieldWithOnTap(
                borderColor: AppColors.greyTextColor,
                prefixIcon: SvgPicture.asset(Assets.person),
                hintTextColor: AppColors.textFieldHint,
                controller: firstName,
                hintText: 'Full Name',
                textInputType: TextInputType.text,
                filledColor: AppColors.whiteColor,
              ),
              CustomTextFieldWithOnTap(
                borderColor: AppColors.greyTextColor,
                prefixIcon: SvgPicture.asset(Assets.email),
                hintTextColor: AppColors.textFieldHint,
                controller: emailController,
                hintText: 'Email',
                textInputType: TextInputType.text,
                filledColor: AppColors.whiteColor,
              ),
              5.y,
              CountryPicker(
                borderColor: AppColors.greyTextColor,
                controller: phone,
                onTapField: false,
                countrySelect: (value) {},
              ),
              5.y,
              CustomTextFieldWithOnTap(
                borderColor: AppColors.greyTextColor,
                maxline: 6,
                filledColor: AppColors.whiteColor,
                hintTextColor: AppColors.textFieldHint,
                controller: emailController,
                hintText: 'Details about the funeral',
                textInputType: TextInputType.text,
              ),
              30.y,
              AppText('Payment method',
                  style: Styles.medium(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.light,
                  )),
              15.y,
              ValueListenableBuilder<Map<int, bool>>(
                valueListenable: payment,
                builder: (context, value, child) {
                  print('building');

                  return Column(
                    children: [
                      PaymentMethods(
                        values: value,
                        onTap: () {
                          payment.value[1] = false;
                          payment.value[0] = true;
                        },
                        image: Assets.masterCard,
                        title: 'Master Card\n090909499',
                        change: true,
                        index: 0,
                      ),
                      15.y,
                      PaymentMethods(
                        values: value,
                        onTap: () {
                          payment.value[0] = false;
                          payment.value[1] = true;
                        },
                        image: Assets.payPal,
                        title: '',
                        index: 1,
                      ),
                    ],
                  );
                },
              ),
              25.y,
              AppText('Service Details',
                  style: Styles.medium(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppColors.light,
                  )),
              5.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('Sub total',
                      style: Styles.medium(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.light,
                      )),
                  AppText('\$ 88.00',
                      style: Styles.medium(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.light,
                      )),
                ],
              ),
              5.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('Service tax',
                      style: Styles.medium(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.light,
                      )),
                  AppText('\$ 10.00',
                      style: Styles.medium(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.light,
                      )),
                ],
              ),
              15.y,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText('Total (incl tax)',
                      style: Styles.medium(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.light,
                      )),
                  AppText('\$ 99.50',
                      style: Styles.medium(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.light,
                      )),
                ],
              ),
              25.y,
              CustomButton(
                  onTap: () {
                    CustomDialog.successDialog(context,
                        title: 'Service booked successfully',
                        message: 'You’ve successfully booked funeral venue!');
                  },
                  text: 'Book'),
              35.y,
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  const PaymentMethods(
      {super.key,
      this.title,
      this.image,
      this.change,
      required this.onTap,
      this.values,
      this.index});

  final String? image;
  final String? title;
  final bool? change;
  final VoidCallback onTap;
  final int? index;

  final Map<int, bool>? values;

  @override
  Widget build(BuildContext context) {
    print(values![index]);

    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 18.sp,
            width: 18.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2.sp),
            ),
            child: Container(
              margin: EdgeInsets.all(3.sp),
              height: 15.sp,
              width: 15.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: values![index] == true
                    ? AppColors.primary
                    : AppColors.whiteColor,
              ),
            ),
          ),
        ),
        15.x,
        SvgPicture.asset(
          image!,
          height: 18.sp,
          width: 18.sp,
        ),
        10.x,
        AppText(title!,
            maxLine: 2,
            style: Styles.medium(
              fontSize: 12.sp,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
            )),
        const Spacer(),
        change != null
            ? Align(
                alignment: Alignment.topRight,
                child: AppText('Change',
                    maxLine: 2,
                    style: Styles.medium(
                      fontSize: 12.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    )),
              )
            : 10.x,
      ],
    );
  }
}

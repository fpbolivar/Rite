import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class Deals extends StatelessWidget {
  Deals({super.key});


  TextEditingController writeCustom = TextEditingController();


  List serviceOffered = [
    '2%',
    '3%',
    '4%',
    '4%',
    '5%',
    '6%'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CrossButtonAppBar(
        title: 'Deals',
        onClose: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            20.y,
            Wrap(
              spacing: 35.sp,
              runSpacing: 12.sp,
              children:serviceOffered.map((e) {
                return ChipWidget(
                  labelText: e,
                );
              }).toList(),
            ),
            10.y,
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.custom),
              hintTextColor: AppColors.textFieldHint,
              controller: writeCustom,
              hintText: 'Write Custom',
              textInputType: TextInputType.text,
              filledColor: AppColors.whiteColor,
              borderColor: AppColors.greyTextColor,
            ),
            300.y,
            CustomButton(
                onTap: () {

            }, text: 'Save')
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String? labelText;
  final Color? chipColor;
  final TextStyle? style;

  const ChipWidget({
    super.key,
    this.height,
    this.width,
    this.labelText,
    this.chipColor,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      width: 80.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: AppColors.greyTextColor,width: 0.50)
      ),
      child: Center(
        child: AppText(
          labelText ?? 'Chat',
          style: style ??
              Styles.regular( color: AppColors.light),
        ),
      ),
    );
  }
}


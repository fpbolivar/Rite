import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/ChechList/check_list.dart';
import 'package:rite_funeral_flutter/imports.dart';

class PriceAndServices extends StatefulWidget {
  const PriceAndServices({super.key});

  @override
  State<PriceAndServices> createState() => _PriceAndServicesState();
}

class _PriceAndServicesState extends State<PriceAndServices> {
  TextEditingController lowPrice =  TextEditingController();

  List<String> titles = [
    "Photography",
    "Research funeral sites",
    "Pre funeral",
    "Post funeral",
    "Video",
    "Digital album",
    "High resolution photos"
  ];

  List<bool> check = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  _onChange(bool? val, int index) {
    setState(() {
      check[index] = val ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CrossButtonAppBar(
        title: "Price & Services",
        onClose: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.y,
            CustomTextFieldWithOnTap(
              prefixIcon: SvgPicture.asset(Assets.card),
              hintTextColor: AppColors.textFieldHint,
              controller: lowPrice,
              hintText: 'Lowest price',
              textInputType: TextInputType.text,
              filledColor: AppColors.textFieldColor,
            ),
            10.y,
            AppText('Services',style: Styles.medium(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),),

            for (int i = 0; i < titles.length; i++)
              CheckAndTitleTile(
                onlyCheckBox: false,
                value: check[i],
                title: titles[i],
                mainAxisAlignment: MainAxisAlignment.start,
                onChanged: (vl) => _onChange(vl, i),
              ),
            130.y,
            CustomButton(onTap: () {

            }, text: 'Save')
          ],

        ),
      ),
    );
  }
}

import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../../../Common/Buttons/custom_button.dart';

class ApplyFilter extends StatelessWidget {
  ApplyFilter({super.key});

  final List<String> cat = ['Flowers', 'Transportation', 'Funnel'];
  final List<String> sub = ['Ghnamrang', 'Gulabi', 'Gulab '];

  final TextEditingController location = TextEditingController();

  String? selectedVal;

  @override
  Widget build(BuildContext context) {
    return MainWidget(
        title: AppStrings.filter,
        body: Column(
          children: [
            30.y,
            CustomDropDownWidget(
              isBorderRequired: true,
              onChanged: (value) {},
              prefixIcon: SvgPicture.asset(Assets.category),
              hintText: 'Category',
              value: selectedVal,
              itemsMap: cat.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              validationText: 'Category Required',
            ),
            15.y,
            CustomDropDownWidget(
              isBorderRequired: true,
              onChanged: (value) {},
              prefixIcon: SvgPicture.asset(Assets.category),
              hintText: 'Sub Category',
              value: selectedVal,
              itemsMap: sub.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              validationText: 'Category Required',
            ),
            10.y,
            Expanded(
              child: CustomTextFieldWithOnTap(
                  borderColor: AppColors.greyTextColor,
                  prefixIcon: SvgPicture.asset(Assets.location),
                  controller: location,
                  hintText: 'Location',
                  textInputType: TextInputType.text),
            ),
            CustomButton(onTap: () {}, text:
            'Search'),
            20.y,
          ],
        ));
  }
}

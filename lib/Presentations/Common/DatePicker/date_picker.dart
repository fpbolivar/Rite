import 'package:intl/intl.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../TextFormFields/custom_text_field.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({required this.controller, this.hints, super.key});

  final TextEditingController controller;
  final String? hints;
  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWithOnTap(
      filledColor: AppColors.textFieldColor,
      controller: widget.controller,
      hintText: widget.hints,
      textInputType: TextInputType.datetime,
      readOnly: true,
      prefixIcon:  SvgPicture.asset(Assets.calenderLight),
      onTap: () => onPick(context),
    );
  }

  void onPick(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(
            days: 20)), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime.now().add(const Duration(days: 20)));
    widget.controller.text = DateFormat("yyyy-MM-dd").format(pickedDate!);
  }
}

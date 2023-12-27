import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/DatePicker/date_picker.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CrossButtonAppBar(
        title: "Add event",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.y,
              CustomTextFieldWithOnTap(
                filledColor: AppColors.textFieldColor,
                  prefixIcon: const Icon(
                    Icons.person_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  controller: TextEditingController(),
                  hintText: "Event name",
                  textInputType: TextInputType.text),
              15.y,
              DatePickerField(
                controller: TextEditingController(),
                hints: "Date",
              ),
              40.y,
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  CustomButton(
        horizontalMargin: 20.sp,
        text: "Add",
        onTap: () {

        },
      ),
    );
  }
}

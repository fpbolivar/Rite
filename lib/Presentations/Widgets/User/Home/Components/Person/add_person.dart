import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/circle_picker_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/DatePicker/date_picker.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TimerPicker/custom_time_picker.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddPerson extends StatefulWidget {
  const AddPerson({super.key});

  @override
  State<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CrossButtonAppBar(
        title: "Add person info",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.y,
              const CirclePickerButton(
                icon: Icons.camera_alt_outlined,
              ),
              15.y,
              CustomTextFieldWithOnTap(
                filledColor: AppColors.textFieldColor,
                  prefixIcon:  SvgPicture.asset(Assets.person),
                  controller: TextEditingController(),
                  hintText: "Name",
                  textInputType: TextInputType.text),
              15.y,
              DatePickerField(

                controller: TextEditingController(),
                hints: "Funeral date",
              ),
             Row(
               children: [
                 Expanded(
                   child: CustomTimePickerWithValidation(
                     prefixIcon: const Icon(
                       Icons.access_time_outlined,
                       color: Colors.grey,
                       size: 25,
                     ),
                     hintText: "Start Time ",
                     width: MediaQuery.sizeOf(context).width,
                     controller: TextEditingController(),
                   ),
                 ),
                 Expanded(
                   child: CustomTimePickerWithValidation(
                   
                     prefixIcon: const Icon(
                       Icons.access_time_outlined,
                       color: Colors.grey,
                       size: 25,
                     ),
                     hintText: "End Time",
                     width: MediaQuery.sizeOf(context).width,
                     controller: TextEditingController(),
                   ),
                 ),
               ],
             ),
              10.y,
              CustomTextFieldWithOnTap(
                  filledColor: AppColors.textFieldColor,
                  prefixIcon:  SvgPicture.asset(Assets.location),
                  controller: TextEditingController(),
                  hintText: "Funeral Venues",
                  textInputType: TextInputType.text),
              40.y,
             CustomButton(onTap: () {

             }, text: 'Save')
            ],
          ),
        ),
      ),
    );
  }
}

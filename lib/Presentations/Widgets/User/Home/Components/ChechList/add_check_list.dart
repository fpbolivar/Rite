import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddCheckList extends StatefulWidget {
  const AddCheckList({super.key});

  @override
  State<AddCheckList> createState() => _AddCheckListState();
}

class _AddCheckListState extends State<AddCheckList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CrossButtonAppBar(
        title: "Add new checklist",
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Spacer(),
            CustomTextFieldWithOnTap(
                prefixIcon: const Icon(
                  Icons.check_box_outlined,
                  color: Colors.grey,
                  size: 25,
                ),
                controller: TextEditingController(),
                hintText: "Checklist name",
                textInputType: TextInputType.text),
              const Spacer(),
               CustomButton(onTap: () {

              }, text: 'Add'),
            20.y,
          ],
        ),
      ),
    );
  }
}

import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddCheckList extends StatelessWidget {
   AddCheckList({super.key});

  TextEditingController checkName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          'Funeral Venue',
          style: Styles.medium(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
         const Spacer(),
          CustomTextFieldWithOnTap(
              controller: checkName,
              hintText: 'Checklist name',
              textInputType: TextInputType.text),
          const Spacer(),
          CustomButton(onTap: () {

          }, text: 'Save')
        ],
      ),
    );
  }
}

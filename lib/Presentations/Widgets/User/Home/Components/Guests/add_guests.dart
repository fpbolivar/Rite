import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Checks/app_check.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TimerPicker/custom_time_picker.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../ChechList/check_list.dart';

class AddGuest extends StatefulWidget {
  const AddGuest({super.key});

  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {

  Map<String, bool> checkList = {
    "venues": false,
    "funeral_sites": false,
    "invite_guest": false
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CrossButtonAppBar(
        title: "Add guest",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.y,
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   // mainAxisSize: MainAxisSize.max,
              //   children: [
              //     AppChip(
              //       onTap: () {},
              //       txt: "Male",
              //     ),
              //     10.x,
              //     AppChip(
              //       onTap: () {},
              //       txt: "Female",
              //     ),
              //     10.x,
              //     AppChip(
              //       borderColor: AppColors.divider,
              //       bgColor: Colors.transparent,
              //       onTap: () {},
              //       txtColor: Colors.black45,
              //       txt: "Family",
              //     ),
              //   ],
              // ),
              // 15.y,
              CustomTextFieldWithOnTap(
                  prefixIcon: const Icon(
                    Icons.person_outlined,
                    color: Colors.grey,
                    size: 25,
                  ),
                  controller: TextEditingController(),
                  hintText: "Name",
                  textInputType: TextInputType.text),
              15.y,
              CustomTextFieldWithOnTap(
                textInputType: TextInputType.text,
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                  size: 25,
                ),
                hintText: "Email (Optional) ",

                controller: TextEditingController(),
              ),
              CustomTextFieldWithOnTap(
                textInputType: TextInputType.text,
                prefixIcon: const Icon(
                  Icons.phone_in_talk_outlined,
                  color: Colors.grey,
                  size: 25,
                ),
                hintText: "Phone number ",
                controller: TextEditingController(),
              ),
              AppText(
                "Invite to",
                style: Styles.medium(fontSize: 17),
              ),
              15.y,
              SizedBox(
                width: 1.sw,
                height: 40,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 0,
                      child: CheckAndTitleTile(
                        onChanged: (val) => _onChange(val, "venues"),
                        title: 'Visitation',
                        value: checkList['venues'],
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                    Flexible(
                      flex: 0,
                      child: CheckAndTitleTile(
                        onChanged: (val) => _onChange(val, "funeral_sites"),
                        title: 'Musical Tributes',
                        value:  checkList['funeral_sites'],
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ],
                ),
              ),
              8.y,
              SizedBox(
                width: 1.sw - 30,
                height: 40,
                child:  CheckAndTitleTile(
                  onChanged: (val) => _onChange(val, "invite_guest"),
                  title: 'Readings and Eulogies',
                  value: checkList['invite_guest'],
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
              40.y,
              const Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  title: "Save",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _onChange(bool? val, String key) {
    setState(() {
      checkList[key] = val ?? false;
    });
  }
}


class CheckAndTitleTile extends StatelessWidget {
  const CheckAndTitleTile(
      {super.key,
        this.onChanged,
        this.value,
        required this.title,
        this.mainAxisSize,
        this.mainAxisAlignment = MainAxisAlignment.spaceBetween});
  final bool? value;
  final String title;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.40.sw,
      child: Row(

        children: [
          AppCheck(
            value: value,
            onChanged: onChanged,
          ),
          Flexible(
            child: AppText(title,
                overflow: TextOverflow.ellipsis,
                style: Styles.medium(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: value ?? false ? Colors.black45 : null,
                )),
          ),
        ],
      ),
    );
  }
}


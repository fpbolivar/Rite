import 'package:rite_funeral_flutter/Applications/Services/PickerServices/picker_services.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/displayImage.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/add_image_widget.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddCommunity extends StatefulWidget {
  AddCommunity({super.key});

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  final TextEditingController title = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();


  String? type;

  List<String> types = ['Private', "Public"];

  List<String?> images = [];

  @override
  Widget build(BuildContext context) {
    return MainWidget(
      title: AppStrings.addNewGroup,
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.y,
            AddImageWidget(
              height: 100.sp,
              onTap: () async {

                images = await PickFile.pickImage();
                setState(() {

                });

              },
            ),
            7.y,
            images.isNotEmpty ?SizedBox(
              height: 100.h,
              width: 1.sw,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return DisplayFileImage(
                    fileImage: images[index].toString(),
                    onDeleteTap: () {
                      setState(() {
                        images.removeAt(index);
                        //image = [];
                      });
                    },
                  );
                },
                separatorBuilder:
                    (BuildContext context, int index) {
                  return SizedBox(
                    width: 5.sp,
                  );
                },
              ),
            )
                : const SizedBox(),
            10.y,
            CustomTextFieldWithOnTap(
                prefixIcon: SvgPicture.asset(Assets.person),
                borderColor: AppColors.textFieldHint,
                controller: title,
                hintText: 'Group title',
                textInputType: TextInputType.text),
            10.y,
            CustomDropDownWidget(
                prefixIcon: SvgPicture.asset(Assets.users),
                hintText: 'Group Type',
                value: type,
                validationText: "Type Required",
                onChanged: (value) {},
                itemsMap: types.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList()),
            10.y,
            CustomTextFieldWithOnTap(

              height: 200.sp,
                maxline: 4,
                borderColor: AppColors.textFieldHint,
                controller: descriptionController,
                hintText: 'Group Description',
                textInputType: TextInputType.text),
            125.y,
            CustomButton(onTap: () {

            }, text: 'Add'),
            10.y,
          ],
        ),
      ),
    );
  }
}

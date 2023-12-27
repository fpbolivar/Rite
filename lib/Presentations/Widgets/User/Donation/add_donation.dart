import 'package:rite_funeral_flutter/Applications/Services/PickerServices/picker_services.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/displayImage.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Common/add_image_widget.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AddDonation extends StatefulWidget {
  AddDonation({super.key});

  @override
  State<AddDonation> createState() => _AddDonationState();
}

class _AddDonationState extends State<AddDonation> {
  TextEditingController title = TextEditingController();

  TextEditingController healthDescr = TextEditingController();

  TextEditingController targetAmount = TextEditingController();

  List<String?> images = [];

  @override
  Widget build(BuildContext context) {
    return MainWidget(
        title: AppStrings.addDonation,
        body: SingleChildScrollView(
          child: Column(
            children: [
              20.y,
              AddImageWidget(
                height: 100.sp,
                onTap: () async {
                  images = await PickFile.pickImage();
                  setState(() {});
                },
              ),
              10.y,
              images.isNotEmpty
                  ? SizedBox(
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
                        separatorBuilder: (BuildContext context, int index) {
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
                  hintText: 'Donation title',
                  textInputType: TextInputType.text),
              10.y,
              CustomTextFieldWithOnTap(
                  height: 200.sp,
                  maxline: 4,
                  borderColor: AppColors.textFieldHint,
                  controller: healthDescr,
                  hintText: 'Heartfelt Description',
                  textInputType: TextInputType.text),
              10.y,
              CustomTextFieldWithOnTap(
                  prefixIcon: SvgPicture.asset(Assets.dollar),
                  borderColor: AppColors.textFieldHint,
                  controller: targetAmount,
                  hintText: 'Target Amount',
                  textInputType: TextInputType.text),
              125.y,
              CustomButton(onTap: () {}, text: 'Add'),
              10.y,
            ],
          ),
        ));
  }
}

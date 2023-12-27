import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/imports.dart';

class SearchFilter extends StatefulWidget {
  SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  String? selectedVal;

  String? swap;

  String? catg;

  String? distance;

  final List<String> cat = ['Flowers', 'Transportation', 'Funnel'];

  final List<String> sub = ['Ghnamrang', 'Gulabi', 'Gulab '];

  final List<String> distanceList = ['5 Miles', '6 Miles', '8 Miles'];

  final List<String> swapList = ['swap', 'v swap', 'new'];

  final TextEditingController location = TextEditingController();

  List tags = [
    'Funeral',
    'Guestbook',
    'Transportation',

  ];

 List listSubtags = [
  'Flowers ',
  'Coffin',
  'Guestbook'
  ];

   int? tagsIndex;

  int? tagsSubIndex;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.sp,
      ),
      child: MainWidget(
          title: AppStrings.filter,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.y,
              CustomDropDownWidget(
                isBorderRequired: true,
                onChanged: (value) {},
                prefixIcon: SvgPicture.asset(Assets.swap),
                hintText: 'Most Recent',
                value: swap,
                itemsMap: swapList.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                validationText: 'Category Required',
              ),
              5.y,
              CustomTextFieldWithOnTap(
                  borderColor: AppColors.greyTextColor,
                  prefixIcon: SvgPicture.asset(Assets.location),
                  controller: location,
                  hintText: 'Location',
                  textInputType: TextInputType.text),
              5.y,
              CustomDropDownWidget(
                isBorderRequired: true,
                onChanged: (value) {},
                prefixIcon: SvgPicture.asset(Assets.category),
                hintText: 'Category',
                value: catg,
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
              15.y,
              CustomDropDownWidget(
                isBorderRequired: true,
                onChanged: (value) {},
                prefixIcon: SvgPicture.asset(Assets.location),
                hintText: 'Distance',
                value: distance,
                itemsMap: distanceList.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                validationText: 'Distance',
              ),
              20.y,
              AppText('Tags',
                  style: Styles.medium(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.medium,
                  )),
              10.y,
              SizedBox(
                height: 30.h,
                width: 1.sw,
                child: ListView.separated(
                  itemCount: tags.length,
                  separatorBuilder: (context, index) {
                    return 10.x;
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          tagsIndex = index;
                          tagsSubIndex = 4;
                        });
                      },
                      child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.sp, vertical: 2.sp),
                          decoration: BoxDecoration(
                            color: tagsIndex == index? AppColors.primary:AppColors.borderColor,
                            borderRadius: BorderRadius.circular(20).r,
                            border: Border.all(color: tagsIndex != index? AppColors.light:AppColors.primary)
                          ),
                          child: Center(
                            child: Center(
                              child: AppText(tags[index],style: Styles.regular(
                                color: tagsIndex == index?AppColors.whiteColor:AppColors.light,
                                fontSize: 14.sp,
                              ),),
                            ),
                          )),
                    );
                  },
                ),
              ),
              10.y,
              SizedBox(
                height: 30.h,
                width: 1.sw,
                child: ListView.separated(
                  itemCount: listSubtags.length,
                  separatorBuilder: (context, index) {
                    return 10.x;
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          tagsSubIndex = index;
                          tagsIndex = 4;
                        });
                      },
                      child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 12.sp, vertical: 2.sp),
                          decoration: BoxDecoration(
                              color: tagsSubIndex == index? AppColors.primary:AppColors.borderColor,
                              borderRadius: BorderRadius.circular(20).r,
                              border: Border.all(color: tagsSubIndex != index? AppColors.light:AppColors.primary)
                          ),
                          child: Center(
                            child: Center(
                              child: AppText(listSubtags[index],style: Styles.regular(
                                color: tagsSubIndex == index?AppColors.whiteColor:AppColors.light,
                                fontSize: 14.sp,
                              ),),
                            ),
                          )),
                    );
                  },
                ),
              ),
              120.y,
              CustomButton(onTap: () {

              }, text: 'Apply')
            ],
          )),
    );
  }
}

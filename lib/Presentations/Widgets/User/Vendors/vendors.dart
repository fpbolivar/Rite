import 'package:rite_funeral_flutter/Domain/Model/Vendors/vendors_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/custom_text_field.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors_search.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'Components/apply_filter.dart';
import 'Components/vender_tile.dart';

class VendorsScreen extends StatelessWidget {
  VendorsScreen({super.key});

  final List<String> itemsList = [
    "UK, London",
    "NewYork US",
    "Wisnghton Dc Us"
  ];

  final List<VendorsModel> listVendors = [
    VendorsModel(
      title: 'Funeral  venues',
      subTitle: 'Banquet Halls, Lawns / Farmhouses, R..',
      image: 'assets/images/onboard1.png',
    ),
    VendorsModel(
      title: 'Flowers',
      subTitle: 'Floral Arrangements',
      image: 'assets/images/flowers.png',
    ),
    VendorsModel(
      title: 'Coffin',
      subTitle: 'Burial, urn',
      image: 'assets/images/flowers.png',
    ),
    VendorsModel(
      title: 'Transportation',
      subTitle: 'Mini Bus, Large bus, Cars ',
      image: 'assets/images/dummy.png',
    ),
    VendorsModel(
      title: 'Guestbook',
      subTitle: 'Wedding Planners, Decorators, Small F..',
      image: 'assets/images/dummy.png',
    ),
    VendorsModel(
      title: 'Transportation',
      subTitle: 'Mini Bus, Large bus, Cars ',
      image: 'assets/images/dummy.png',
    ),
    VendorsModel(
      title: 'Guestbook',
      subTitle: 'Wedding Planners, Decorators, Small F..',
      image: 'assets/images/dummy.png',
    ),
  ];

  String? selectValue;
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.y,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 40.sp,
                      width: 100.sp,
                      child: GeneralizedDropDown(
                        hint: 'Location',
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.medium,
                          size: 23.sp,
                        ),
                        items: itemsList,
                        selectedValue: selectValue,
                        onChanged: (String value) {
                          selectValue = value;
                        },
                      ),
                    ),
                  ),
                  20.x,
                  const Spacer(),
                  Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            Assets.heart,
                            height: 20.sp,
                            width: 20.sp,
                          ))),
                  10.x,
                  SvgPicture.asset(
                    Assets.notificationBold,
                    height: 20.sp,
                    width: 20.sp,
                  ),
                ],
              ),
              5.y,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextFieldWithOnTap(
                        borderColor: AppColors.textFieldHint,
                        isBorderRequired: true,
                        suffixIcon: InkWell(
                            onTap: () {
                              Navigate.to(context, ApplyFilter());
                            },
                            child: SvgPicture.asset(Assets.filter)),
                        filledColor: AppColors.textFieldColor,
                        controller: search,
                        hintText: 'Search Vendors',
                        textInputType: TextInputType.text),
                  ),
                  10.x,
                  InkWell(
                    onTap: () {
                      Navigate.to(context, VendorsSearch());
                    },
                    child: Container(
                      height: 45.sp,
                      width: 45.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: SvgPicture.asset(Assets.search,
                            color: AppColors.whiteColor,height: 17.sp,width: 17.sp,),
                      ),
                    ),
                  )
                ],
              ),
              10.y,
              AppText('Vendors',
                  style: Styles.medium(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.medium,
                  )),
              10.y,
              SizedBox(
                height: 0.60.sh,
                width: 1.sw,
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigate.to(context, VendorsSearch());
                        },
                        child: VendorTile(
                          vendors: listVendors[index],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return 10.y;
                    },
                    itemCount: listVendors.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}

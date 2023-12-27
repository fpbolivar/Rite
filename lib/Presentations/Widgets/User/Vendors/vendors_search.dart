import 'package:rite_funeral_flutter/Domain/Model/Saved/my_saved.dart';
import 'package:rite_funeral_flutter/Presentations/Common/FunctionWidget/customBottomSheet.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors_details.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'Components/search_filter.dart';
import 'Components/vender_search_item.dart';

class VendorsSearch extends StatelessWidget {
  VendorsSearch({super.key});

  final List<MySavedModel> model = [
    MySavedModel(
        title: 'Harmony Farewell House',
        image: 'assets/images/onboard1.png',
        location: 'London UK',
        reivew: 4.0,
        price: '\$300'),
    MySavedModel(
        title: 'Harmony Farewell House',
        image: 'assets/images/onboard2.png',
        location: 'UK London',
        reivew: 4.9,
        price: '\$400')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            45.y,
            Row(
              children: [
                const Expanded(child: BackArrowWidget()),
                AppText('Vendors',
                    style: Styles.medium(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      color: AppColors.medium,
                    )),
                const Spacer(),
              ],
            ),
            20.y,
            Row(children: [
              InkWell(
                onTap: () {
                  CustomBottomSheet().showBottomSheet(context, SearchFilter());
                },
                child: Container(
                  height: 40.sp,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    border: Border.all(color: AppColors.medium),
                  ),
                  child: SvgPicture.asset(Assets.filterF),
                ),
              ),
              10.x,
              Container(
                height: 40.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(color: AppColors.medium),
                ),
                child: Row(
                  children: [
                    AppText(
                      'Sort By',
                      style: Styles.medium(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.x,
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.medium,
                      size: 15.sp,
                    )
                  ],
                ),
              ),
              10.x,
              Container(
                height: 40.sp,
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(color: AppColors.medium),
                ),
                child: Center(
                  child: AppText(
                    'Rating',
                    style: Styles.medium(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ]),
            20.y,
            AppText('2,144 Results',
                style: Styles.medium(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.medium,
                )),
            10.y,
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigate.to(context, const VendorsDetails());
                      },
                      child: SearchItemTile(
                        modelData: model[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return 10.y;
                  },
                  itemCount: model.length),
            )
          ],
        ),
      ),
    );
  }
}

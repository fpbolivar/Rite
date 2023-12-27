import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/add_card_details.dart';
import 'package:rite_funeral_flutter/imports.dart';

class BoostBusiness extends StatelessWidget {
  BoostBusiness({super.key});

  TextEditingController writeCustom = TextEditingController();

  List serviceOffered = ['2%', '3%', '4%', '4%', '5%', '6%'];

  List<String> list = ['\$35 per week','\$75 per month'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CrossButtonAppBar(
        title: AppStrings.boostBusiness,
        onClose: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            20.y,
            for (int i = 0; i < 2; i++)  TileContainer(title: list[i],selectedIndex: i,),
            300.y,
            CustomButton(onTap: () {}, text: 'Next')
          ],
        ),
      ),
    );
  }
}

class TileContainer extends StatelessWidget {
   TileContainer({super.key,this.title,this.selectedIndex});


  String? title;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.to(context,  AddCardDetails());
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.sp),
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp),
        height: 100.h,
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: selectedIndex == 0? AppColors.primary:AppColors.borderColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title!,
              style: Styles.medium(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            10.y,
            Row(
              children: [
                Container(
                  height: 5.sp,
                  width: 5.sp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.light,
                  ),
                ),
                5.x,
                AppText(
                  'Get more business reach',
                  style: Styles.regular(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: selectedIndex == 0? AppColors.light:AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
            5.y,
            Row(
              children: [
                Container(
                  height: 5.sp,
                  width: 5.sp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.light,
                  ),
                ),
                5.x,
                AppText(
                  'Help you more business',
                  style: Styles.regular(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: selectedIndex == 0? AppColors.light:AppColors.greyTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

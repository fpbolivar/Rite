import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Home/Components/chart_data.dart';
import 'package:rite_funeral_flutter/imports.dart';

class TransitionData {
  String? title;
  String? payment;
  String? date;

  TransitionData({this.title, this.payment, this.date});
}

class Analytics extends StatelessWidget {
  Analytics({super.key});

  String? dropValue;

  List<TransitionData> transition = [
    TransitionData(
      payment: '\$2,540',
      title: 'Andrea Porter',
      date: '12 Jan, 2023',
    ),
    TransitionData(
      payment: '\$2,540',
      title: 'Andrea Porter',
      date: '12 Jan, 2023',
    ),
    TransitionData(
      payment: '\$2,540',
      title: 'Andrea Porter',
      date: '12 Jan, 2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            35.y,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackArrowWidget(),
                AppText(  AppStrings.anyitics,style: Styles.medium(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),),
                10.x,
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: GeneralizedDropDown(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.greyTextColor,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.sp),
                      isBorder: true,
                      width: 40.sp,
                      hint: 'Last 12 month',
                      selectedValue: dropValue,
                      onChanged: (value) {},
                      items: const ['12 months', '10 months', '4months']),
                ),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 10.sp,
                    )),
              ],
            ),
            10.y,
            FractionallySizedBox(
              widthFactor: 1.07,
              child: VerticalBarChart(),
            ),
            15.y,
            AppText(
              'Transition History',
              style: Styles.medium(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            7.y,
            SizedBox(
              height: 200.h,
              width: 1.sw,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return 10.y;
                },
                itemCount: transition.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AppText(
                            transition[index].title!,
                            style: Styles.regular(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          2.y,
                          AppText(
                            transition[index].date!,
                            style: Styles.light(fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      AppText(
                        transition[index].payment!,
                        style: Styles.regular(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

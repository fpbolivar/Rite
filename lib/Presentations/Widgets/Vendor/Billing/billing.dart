import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Billing/Components/withdraw_payments.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Home/Components/analytics.dart';
import 'package:rite_funeral_flutter/imports.dart';

class Billing extends StatelessWidget {
   Billing({super.key});


  List<Map<String, dynamic>> list = [
    {
      'image': Assets.bookingB,
      'price': "\$15,892",
      'title': 'Total payment',
    },
    {
      'image': Assets.booking,
      'price': "\$1005",
      'title': 'This month earning',
    },
    {
      'image': Assets.starB,
      'price': "\$10000",
      'title': 'Cancel payment',
    },
    {
      'image': Assets.callingB,
      'price': "\$100",
      'title': 'Available for withdraw',
    }
  ];

   List<TransitionData> transition = [
     TransitionData(
       payment: '\$2,540',
       title: 'Stripe',
       date: '12 Jan, 2023',
     ),
     TransitionData(
       payment: '\$2,540',
       title: 'Stripe',
       date: '12 Jan, 2023',
     ),
     TransitionData(
       payment: '\$2,540',
       title: 'Bank Account',
       date: '12 Jan, 2023',
     ),
     TransitionData(
       payment: '\$2,540',
       title: 'Stripe',
       date: '12 Jan, 2023',
     ),
     TransitionData(
       payment: '\$2,540',
       title: 'Stripe',
       date: '12 Jan, 2023',
     ),
     TransitionData(
       payment: '\$2,540',
       title: 'Bank Account',
       date: '12 Jan, 2023',
     ),
   ];



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: AppText(
          "Payments",
          style: Styles.medium(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.light,
        ),
        ),
      ),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250.h,
              width: 1.sw,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                padding: EdgeInsets.zero,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 1.3,mainAxisSpacing: 15,
                  crossAxisSpacing: 15,),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    width: 180.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        15.y,
                        SvgPicture.asset(
                          list[index]['image'],
                          height: 32.sp,
                          width: 32.sp,
                          colorFilter: const ColorFilter.mode(

                              AppColors.primary,
                              BlendMode.srcIn),),
                        12.y,
                        AppText(
                          list[index]['price'],
                          style: Styles.medium(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        3.y,
                        AppText(
                          list[index]['title'],
                          style: Styles.medium(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            10.y,
            AppText(
              "Recent withdraw",
              style: Styles.medium(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.light,
              ),
            ),
            5.y,
            SizedBox(
              height: 220.h,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            transition[index].payment!,
                            style: Styles.medium(
                                fontSize: 16.sp, fontWeight: FontWeight.w500),
                          ),
                          2.y,
                          AppText(
                            transition[index].title!,
                            style: Styles.light(fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      AppText(
                        transition[index].date!,
                        style: Styles.regular(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                },
              ),
            ),
            CustomButton(onTap: () {
              Navigate.to(context, const WithDrawPayments());
            }, text: 'WithDraw Payment')
          ],
        ),
      ),
    );
  }
}

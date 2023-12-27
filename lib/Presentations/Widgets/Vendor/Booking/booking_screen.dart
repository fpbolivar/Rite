import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/ChechList/check_list.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Booking/Components/all_check_list.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Booking/Components/booking_tile.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Booking/Components/view_all_upcoming_booking.dart';
import 'package:rite_funeral_flutter/imports.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  List<Map<String, dynamic>> list = [
    {
      'image': Assets.bookingB,
      'price': "15,892",
      'title': 'Total Bookings',
    },
    {
      'image': Assets.booking,
      'price': "15",
      'title': 'Upcoming Bookings',
    },
  ];


  List<String> titles = [
    "Research venues",
    "Research funeral sites",
    "Invite guests",
  ];

  List<bool> check = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: AppText('All Booking',style: Styles.medium(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.medium,
        ),),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding:  EdgeInsets.symmetric(horizontal: 18.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.h,
              width: 1.sw,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                padding: EdgeInsets.zero,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 1.2,mainAxisSpacing: 15,
                  crossAxisSpacing: 15,),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        25.y,
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
            Row(
              children: [
                AppText('Upcoming bookings',style: Styles.medium(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),),
               const Spacer(),
                SvgPicture.asset(Assets.calenderLight),
                10.x,
                AppText('Filter',style: Styles.medium(
                  fontSize: 14.sp,
                ),),
              ],
            ),
            10.y,
            ListView.separated(
              physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
              return  UpcomingTile(
                showExtraRow: false,
              );
            }, separatorBuilder: (context, index) {
              return 10.y;
            }, itemCount: 2),
            10.y,
            CustomButton(
              onTap: () {
                Navigate.to(context, const ViewUpcomingBooking());
              }, text: 'View all booking',

              borderColor: AppColors.greyTextColor,
              textColor: AppColors.greyTextColor,
              bgColor: AppColors.whiteColor,
              isBorder: true,
              horizontalMargin: 10.sp,
              leadingSvgIcon: true,
              gapWidth: 20.sp,

              trailingIcon
                  : 'assets/icons/arrow.svg',
            ),
            10.y,
            AppText('Check List',style: Styles.medium(
              fontSize: 14.sp,
            ),),
            for (int i = 0; i < titles.length; i++)
              CheckAndTitleTile(
                value: check[i],
                title: titles[i],
                mainAxisAlignment: MainAxisAlignment.start,
                onChanged: (vl) => _onChange(vl, i),
              ),

            10.y,
            CustomButton(
              onTap: () {
                Navigate.to(context, AllCheckList());
              }, text: 'View all checkList',

              borderColor: AppColors.greyTextColor,
              textColor: AppColors.greyTextColor,
              bgColor: AppColors.whiteColor,
              isBorder: true,
              horizontalMargin: 10.sp,
              leadingSvgIcon: true,
              gapWidth: 20.sp,

              trailingIcon
                  : 'assets/icons/arrow.svg',
            ),
          ],
        ),
      ),
    );
  }
  _onChange(bool? val, int index) {
    setState(() {
      check[index] = val ?? false;
    });
  }
}

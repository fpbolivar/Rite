import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Booking/Components/booking_tile.dart';
import 'package:rite_funeral_flutter/imports.dart';

class ViewUpcomingBooking extends StatelessWidget {
  const ViewUpcomingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
       body: Padding(
         padding:  EdgeInsets.symmetric(horizontal: 12.sp),
         child: SingleChildScrollView(
           physics: const NeverScrollableScrollPhysics(),
           child: Column(
             children: [
               10.y,
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                const BackArrowWidget(),
                   const Spacer(),
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
               15.y,
               SizedBox(
                 height: 1.sh - 20,
                 width: 1.sw,
                 child: ListView.separated(

                     physics: const BouncingScrollPhysics(),
                     shrinkWrap: true,
                     itemBuilder: (context, index) {
                       return  UpcomingTile(
                         showExtraRow: true,
                       );
                     }, separatorBuilder: (context, index) {
                   return 10.y;
                 }, itemCount: 8),
               ),
               10.y,
             ],
           ),
         ),
       ),
      ),
    );
  }
}

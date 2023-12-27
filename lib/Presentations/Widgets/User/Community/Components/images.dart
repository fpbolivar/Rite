import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class GroupImages extends StatelessWidget {
  const GroupImages({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Expanded(
            child: CacheImage(
                height: 250.sp,
                width: 100.sp,
                url:  'assets/images/group1.png',radius: BorderRadius.circular(10.sp),),
          ),
          Expanded(
            child: Column(
              children: [
                CacheImage(
                  height: 120.sp,
                  width: 140.sp,
                  url:  'assets/images/onboard2.png',radius: BorderRadius.circular(10.sp),),
                10.y,
                CacheImage(
                  height: 120.sp,
                  width: 140.sp,
                  url:  'assets/images/onboard1.png',radius: BorderRadius.circular(10.sp),),
              ],
            ),
          )
        ],),
        10.y,
        CacheImage(
          height: 120.sp,
          width: 1.sw,
          url:  'assets/images/group1.png',radius: BorderRadius.circular(10.sp),),
        20.y,
      ],
    );
  }
}

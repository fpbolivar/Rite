import 'package:rite_funeral_flutter/Domain/Model/Vendors/vendors_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class MembersTile extends StatelessWidget {
  const MembersTile({super.key,this.vendors});

  final VendorsModel? vendors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          ),
      child: Row(
        children: [
          CacheImage(
            url: vendors!.image!,
            isCircle: true,
            height: 50.sp,
            width: 50.sp,
            radius:  BorderRadius.circular(30.sp),
          ),
          10.x,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(vendors?.title ?? "",
                    style: Styles.medium(
                        fontWeight: FontWeight.w500,
                        color: AppColors.medium,
                        fontSize: 16.sp)),
                2.y,
                AppText(vendors!.subTitle ?? "",
                    style: Styles.medium(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.regular)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

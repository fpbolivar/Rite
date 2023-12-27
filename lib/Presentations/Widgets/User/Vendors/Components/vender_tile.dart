import 'package:rite_funeral_flutter/Domain/Model/Vendors/vendors_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class VendorTile extends StatelessWidget {
  const VendorTile({super.key,this.vendors});

 final VendorsModel? vendors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: AppColors.borderColor)),
      child: Row(
        children: [
          AssetImageWidget(
            url: vendors!.image!,
            isCircle: true,
            radius: 30.sp,
          ),
          10.x,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(vendors?.title ?? "",
                        style: Styles.medium(
                            fontWeight: FontWeight.w500,
                            color: AppColors.medium,
                            fontSize: 18.sp)),
                    5.x,
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 17.sp,
                    )
                  ],
                ),
                2.y,
                AppText(vendors!.subTitle ?? "",
                    style: Styles.medium(
                        fontSize: 14.sp,
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

import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({super.key,this.title,this.image,this.index,this.onTap});

final String? title;
final String? image;
final VoidCallback? onTap;
 final bool? index;
//final int? priIndex;

  @override
  Widget build(BuildContext context) {

    print(index.toString());

    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 15.sp),
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.borderColor,width: 0.50),
      ),
      child: Row(
        children: [
         SvgPicture.asset(image!,height: 20.sp,width: 20.sp,),
          10.x,
          Expanded(
            child: AppText(title!, style: Styles.regular(
              fontSize:18.sp,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
            )),
          ),

          InkWell(
            onTap: onTap,
            child: Container(
              height: 20.sp,
              width: 20.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black,width: 2.5.sp),
              ),
              child:  Container(
                margin: EdgeInsets.all(3.sp),
                height: 18.sp,
                width: 10.sp,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == true? AppColors.primary:AppColors.whiteColor,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}

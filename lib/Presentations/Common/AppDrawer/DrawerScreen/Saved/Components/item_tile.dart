import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/Domain/Model/Saved/my_saved.dart';
import 'package:rite_funeral_flutter/imports.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({super.key,this.modelData});

 final MySavedModel? modelData;


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                image: DecorationImage(image: AssetImage(modelData!.image!),fit: BoxFit.cover)
              ),
          child: Stack(
            children: [
              Positioned(
                top: 10.sp,
                right:6.sp,
                child: Container(
                  height: 25.sp,
                  width: 25.sp,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.borderColor)
                  ),
                  child: Center(child: SvgPicture.asset(Assets.favourite,height: 20.sp),),
                ),
              )
            ],
          ),
          ),
          10.y,
          Row(
             children: [
               Expanded(
                 child: AppText(modelData!.title!, style: Styles.bold(
                   fontSize: 16.sp,
                   color: AppColors.bold,
                 )),
               ),
               const Icon(Icons.star,color: Colors.amber,),
               AppText(modelData!.reivew.toString(), style: Styles.bold(
                 fontSize: 16.sp,
                 color: AppColors.bold,
               )),
             ],
          ),
          AppText(modelData!.location!, style: Styles.medium(
            fontSize: 12.sp,
            color: AppColors.greyTextColor,
            fontWeight: FontWeight.w400,
          ))
        ],
      ),
    );
  }
}

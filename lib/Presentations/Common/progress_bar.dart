
import 'package:rite_funeral_flutter/imports.dart';

class ProgressBar extends StatelessWidget {
   const ProgressBar({required this.total,required this.target,super.key,});

  final double target;
  final double total;




   @override
  Widget build(BuildContext context) {

   double parcentage = (target * 100) / total;

   double percentageWidth = 1.sw * (parcentage /100);

    return Column(
      children: [
        SizedBox(
          height: 7.sp,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 7.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.borderColor,
                  borderRadius: BorderRadius.circular(4.sp),
                ),
              ),
              Container(
                height: 7.h,
                width: percentageWidth,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4.sp),
                ),
              ),
            ],
          ),
        ),
        5.y,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          RichText(text:TextSpan(
            text: 'Target:  ',
            style: Styles.regular(
              fontSize: 20.sp,
              color: AppColors.bold,
            ),
            children: [
              TextSpan(
              text: '\$${target.toInt()}',
              style: Styles.bold(
                fontSize: 18.sp,
                color: AppColors.bold,
              ),),

            ]
          ),
          ),
            AppText(
             '${parcentage.toInt()}%',
              style: Styles.bold(
                fontSize: 18.sp,
                color: AppColors.bold,
              ),),
        ],)
      ],
    );
  }
}

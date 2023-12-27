import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/imports.dart';

class TabsTiles extends StatelessWidget {
  const TabsTiles({super.key,this.title,this.image,this.onTap,this.isLogout});

 final String? image;
 final String? title;
 final VoidCallback? onTap;
  final bool? isLogout;


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      focusColor: AppColors.whiteColor,
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(image!),
          12.x,
          Expanded(
            child: AppText(title!, style: Styles.medium(
              color: AppColors.bold,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            )),
          ),
        isLogout == false?10.x:  Icon(Icons.arrow_forward_ios,color: AppColors.medium,size:
           18.sp,),
        ],
      ),
    );
  }
}

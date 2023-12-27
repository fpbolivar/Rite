import 'dart:io';

import 'package:rite_funeral_flutter/imports.dart';

class DisplayFileImage extends StatelessWidget {
  final String fileImage;
  final VoidCallback onDeleteTap;

  // final  int index;

  const DisplayFileImage({
    super.key,
    required this.fileImage,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            // border: Border.all(
            //   color: AppColors.primaryColor,
            // ),
          ),
          child: Center(
            child: SizedBox(
              width: 96.w,
              height: 95.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(fileImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 1,
          child:Container(
            height: 15.sp,
            width: 15.sp,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary
            ),
            child: GestureDetector(
                onTap: onDeleteTap,
                child: SvgPicture.asset(Assets.cross,color: AppColors.whiteColor,)),
          ),
        )
      ],
    );
  }
}

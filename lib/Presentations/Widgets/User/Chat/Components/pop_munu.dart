import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/Data/Resources/assets.dart';
import 'package:rite_funeral_flutter/imports.dart';

class PopMenu extends StatelessWidget {
  const PopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      //padding: EdgeInsets.zero,

      position: PopupMenuPosition.under,
      color: Colors.white,
      elevation: 0,
      offset: Offset(-15.sp, 10.sp),
      constraints: BoxConstraints(
          minWidth: 140.sp,
          maxWidth: 140.sp,
          minHeight: 80.sp,
          maxHeight: 80.sp),
      enabled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: const BorderSide(color: AppColors.light)),
      onSelected: (value) async {
        print(value);
        // if (value == MenuItem.edit) {
        //   // ///logic for edit
        // }
      },
      child: SizedBox(
        height: 20.sp,
        width: 20.sp,
        child: SvgPicture.asset(
          Assets.threeDots,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: MenuItem1.report,
          padding: EdgeInsets.only(left: 10.sp, top: 5.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                  'assets/icons/report.svg',

                  )),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Report user',
                    style: Styles.medium( fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),

        //delete
        PopupMenuItem(
          value: MenuItem1.block,
          padding: EdgeInsets.only(left: 10.sp, top: 10.sp),
          height: 30.sp,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    'assets/icons/block.svg'
                  )),
              4.x,
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 2.sp),
                  child: AppText(
                    'Block user',
                    style: Styles.medium( fontSize: 16.sp),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum MenuItem1 {
  report,
  block,
}


import 'package:rite_funeral_flutter/imports.dart';

class GroupPopMenu extends StatelessWidget {
  const GroupPopMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      //padding: EdgeInsets.zero,

      position: PopupMenuPosition.under,
      color: Colors.white,
      elevation: 0,
      offset: Offset(-15.sp, 10.sp),

      constraints: BoxConstraints(
          minWidth: 100.sp,
          maxWidth: 100.sp,
          minHeight: 110.sp,
          maxHeight: 110.sp),
      enabled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: const BorderSide(color: AppColors.borderColor)),
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
          padding: EdgeInsets.zero,
          value: MenuItem1.report,
          height: 10.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: AppText(
                  'Edit Group',
                  style: Styles.regular( fontSize: 14.sp),
                  textAlign: TextAlign.left,
                ),
              ),
              15.y,
            ],
          ),
        ),
        //delete
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: MenuItem1.block,
          height: 10.sp,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: AppText(
                  'Add People',
                  style: Styles.regular( fontSize: 14.sp),
                  textAlign: TextAlign.left,
                ),
              ),
              15.y,
            ],
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: MenuItem1.block,
          height: 10.sp,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: AppText(
                  'Invite vi Link',
                  style: Styles.regular( fontSize: 14.sp),
                  textAlign: TextAlign.left,
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
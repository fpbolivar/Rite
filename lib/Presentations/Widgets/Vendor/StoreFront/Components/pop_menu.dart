
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/boost_business.dart';
import 'package:rite_funeral_flutter/imports.dart';
import 'package:share_plus/share_plus.dart';

class StorePop extends StatelessWidget {
  const StorePop({super.key});

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
          maxWidth: 110.sp,
          minHeight: 80.sp,
          maxHeight: 80.sp),
      enabled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
          side: const BorderSide(color: AppColors.borderColor)),
      onSelected: (value) async {
        print(value);
        if (value == MenuItem1.boost) {
          Navigate.to(context, BoostBusiness());
        } else{
          await Share.share('Share Invitation Link',
              subject: 'The soul is on the way to heaven.');
        }
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
          value: MenuItem1.share,
          height: 10.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/share_l.svg'),
                    10.x,
                    AppText(
                      'Share',
                      style: Styles.regular( fontSize: 14.sp),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              15.y,
            ],
          ),
        ),
        //delete
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: MenuItem1.boost,
          height: 10.sp,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.sp),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.boost,color: AppColors.light,height: 20.sp,width: 20.sp,),
                    5.x,
                    AppText(
                      'Boost',
                      style: Styles.regular( fontSize: 14.sp),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              15.y,
            ],
          ),
        ),
      ],
    );
  }
}

enum MenuItem1 {
  share,
  boost,
}
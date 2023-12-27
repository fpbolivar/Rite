import 'package:rite_funeral_flutter/Domain/Model/Community/groups_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class GroupTile extends StatelessWidget {
  const GroupTile({super.key,this.groups});

 final GroupModel? groups;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110.sp,
            width: 110.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              image: DecorationImage(image: AssetImage(groups?.image??""),fit: BoxFit.cover)
            ),
          ),
          10.x,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(groups!.title??"",style: Styles.medium(
                  color: AppColors.bold,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),),
                5.y,
                AppText(groups!.desc??"",
                  maxLine: 2,
                  style: Styles.medium(
                  color: AppColors.greyTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),),
                8.y,
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // AppText('${groups!.payment}',style: Styles.medium(
                        //   color: AppColors.bold,
                        //   fontSize: 14.sp,
                        //   fontWeight: FontWeight.w500,
                        // ),),
                        AppText('${groups!.posts}',style: Styles.medium(
                          color: AppColors.bold,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),),
                      ],
                    ),
                    30.x,
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          width: 150,
                          // color: Colors.teal,
                          height: 42,
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              for (var i = 0; i < 5; i++)
                                i < 4
                                    ? Positioned(
                                  left: 12 * (i + 1),
                                  child: CacheImage(
                                    isCircle: true,
                                    url: Assets.image,
                                    fit: BoxFit.contain,
                                    height: 23.sp,
                                    width: 23.sp,
                                  ),
                                )
                                    : Positioned(
                                    left: 12 * (i + 1),
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 13).r,
                                      decoration:  const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: AppText(
                                        '+${groups!.user}',
                                        style: Styles.medium(
                                          fontWeight: FontWeight.w500,
                                            fontSize: 14.sp),
                                      ),
                                    )),
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

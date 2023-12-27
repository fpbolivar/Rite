
import 'package:rite_funeral_flutter/Domain/Model/Community/groups_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/round_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/discussion.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/images.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/members.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/sliver_app_bar_bacground.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/Components/about_text.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/Components/google_maps.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/Components/socail_buttons.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/book_vendor.dart';
import 'package:rite_funeral_flutter/imports.dart';

class VendorsDetails extends StatefulWidget {
  const VendorsDetails({super.key, this.groupModel});

  final GroupModel? groupModel;

  @override
  State<VendorsDetails> createState() => _VendorsDetailsState();
}

class _VendorsDetailsState extends State<VendorsDetails> {
  final ScrollController controller = ScrollController();

  Widget selected = 0.x;

  TextEditingController message = TextEditingController();

  ScrollController scrollController = ScrollController();

  List<Widget> tabs = [
    const CustomWidget(),
    const GroupImages(),
    GroupMembers(),
  ];

  @override
  void initState() {
    selected = tabs[0];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: controller,
          slivers: <Widget>[
            SliverAppBar(
              leadingWidth: 1.sw,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.white,
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 270,
              collapsedHeight: 60,
              flexibleSpace: SliverAppBarBackground(
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      CacheImage(
                        url: 'assets/images/group1.png',
                        height: 260.sp,
                        width: 1.sw,
                        radius: BorderRadius.circular(12.sp),
                      ),
                      Positioned(
                        left: 5.sp,
                        right: 5.sp,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.sp, top: 10.sp),
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const BackButton(
                                  color: AppColors.whiteColor,
                                ),
                              const  Spacer(),
                                Container(
                                    padding: EdgeInsets.all(1.sp),
                                    decoration: const BoxDecoration(
                                      color: AppColors.borderColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      'assets/icons/share.svg',
                                      height: 25.sp,
                                      width: 25.sp,
                                      color: AppColors.light,
                                    ))),
                                10.x,
                                Container(
                                  height: 25.sp,
                                  width: 25.sp,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.borderColor)
                                  ),
                                  child: Center(child: SvgPicture.asset(Assets.favourite,height: 20.sp),),
                                ),
                              ]),
                        ),
                      ),
                      Positioned(
                          right: 15.sp,
                          top: 190,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.sp, horizontal: 15.sp),
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10.sp)),
                            child: AppText(
                              '3/99',
                              style: Styles.regular(color: Colors.blue),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              bottom: const RoundAppBar(
                backgroundColor: AppColors.whiteColor,
                height: 30,
                child: SizedBox(
                  height: 30,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20).r,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(4.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.boost),
                                    6.x,
                                    AppText(
                                      'Boost Service',
                                      style: Styles.regular(
                                          fontSize: 12.sp,
                                          color: AppColors.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                              AppText(
                                'Forum \$1200',
                                style: Styles.medium(
                                  color: AppColors.light,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          7.y,

                          AppText(
                            'Harmony Farewell House',
                            style: Styles.medium(
                              color: AppColors.light,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          2.y,
                          AppText(
                            'Norwalk, California (view on map)',
                            style: Styles.medium(
                              color: AppColors.light,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          10.y,
                          AppText(
                            'About us',
                            style: Styles.medium(
                              color: AppColors.light,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.y,
                          const DescriptionTextWidget(
                            text:
                                'Harmony Farewell House is committed to facilitating a meaningful and dignified farewell for those who have passed away, providing a space where the journey from grief to healing can begin. In times of loss, Harmony Farewell House stands as a symbol of comfort and unity, embracing the notion that even in sorrow',
                          ),
                          10.y,
                          const SocialButtons(),
                          15.y,
                          AppText('Services',style: Styles.medium(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.light,
                          ),),
                          10.y,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ServiceTile(text: 'Compassionate Staff',),
                              const ServiceTile(text: 'Elegant Chapel',),
                              8.x,


                            ],
                          ),
                          7.y,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ServiceTile(text: 'Private Family Rooms',),
                              const ServiceTile(text: 'Memorial Displays',),
                              8.x,

                            ],
                          ),
                          10.y,
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6.sp),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.whiteColor),
                                    shape: BoxShape.circle,
                                  ),
                                    child: SvgPicture.asset(Assets.cross,color: Colors.white,height: 15,),),
                                6.x,
                                AppText(
                                  '5% discount on first order use (5%dec code)',
                                  style: Styles.regular(
                                      fontSize: 12.sp,
                                      color: AppColors.whiteColor),
                                ),
                              ],
                            ),
                          ),
                          10.y,
                          SizedBox(
                              height: 200.sp,
                              width: 1.sw,
                              child: const GoogleMps()),
                          10.y,
                          Row(
                            children: [
                              SvgPicture.asset(Assets.location),
                              6.x,
                              AppText(
                                'Norwalk, California',
                                style: Styles.medium(
                                  color: AppColors.light,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          30.y,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              5.x,
                              ContactButton(
                                onTap: (){
                                  Navigate.to(context, BookVendor());
                                },
                                title: 'Book',
                              ),
                              ContactButton(
                                title: 'Call',
                                icon: Assets.callBold,
                              ),
                              ContactButton(
                                title: 'Chat',
                                icon: Assets.chat,
                              ),
                              5.x,
                            ],
                          ),
                          20.y,

                        ],
                      ));
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ContactButton extends StatelessWidget {
   ContactButton({super.key,this.icon,this.title,this.onTap});

  String? icon;
  String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.sp,horizontal: 20.sp),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(25.sp),
        ),
        child: Row(
          children: [
           icon!=null? SvgPicture.asset(icon!,color: Colors.white,height: 20,):2.y,
           icon!=null? 6.x:4.x,
            AppText(
              title!,
              style: Styles.regular(
                  fontSize: 12.sp,
                  color: AppColors.whiteColor),
            ),
            icon!=null? 0.x:4.x,
          ],
        ),
      ),
    );
  }
}


class ServiceTile extends StatelessWidget {
  const ServiceTile({super.key,required this.text});
 final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check,color: AppColors.primary,),
        AppText(text,style: Styles.regular(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),)
      ],
    );
  }
}


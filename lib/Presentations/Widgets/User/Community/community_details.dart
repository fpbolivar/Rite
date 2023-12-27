import 'package:rite_funeral_flutter/Domain/Model/Community/groups_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/round_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TabBar/custom_tab_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/pop_menu.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/discussion.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/images.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/members.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CommunityDetails extends StatefulWidget {
  const CommunityDetails({super.key, this.groupModel});


  final GroupModel? groupModel;

  @override
  State<CommunityDetails> createState() => _CommunityDetailsState();
}

class _CommunityDetailsState extends State<CommunityDetails> {
  final ScrollController controller = ScrollController();

  Widget selected = 0.x;

  TextEditingController message = TextEditingController();


   List<Widget> tabs =  [
   CustomWidget(),
     GroupImages(),
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
              leading: const ColoredBox(
                color: AppColors.whiteColor,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                BackButton(),
                      GroupPopMenu(),
                ]),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.white,
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 360,
              collapsedHeight: 60,
              flexibleSpace:  FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      50.y,
                      CacheImage(url: widget.groupModel!.image!,height: 150.sp,width: 1.sw,radius: BorderRadius.circular(12.sp),),
                      5.y,
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: AppText(
                              widget.groupModel!.title!,
                              style: Styles.medium(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 115,
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
                                          padding: const EdgeInsets.only(
                                              left: 13)
                                              .r,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: AppText(
                                            '+${widget.groupModel!.user}',
                                            style: Styles.medium(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp),
                                          ),
                                        )),
                                ],
                              )),
                        ],
                      ),
                      2.y,
                      AppText(
                        widget.groupModel!.posts!,
                        maxLine: 3,
                        style: Styles.medium(
                          color: AppColors.bold,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              bottom: RoundAppBar(
                backgroundColor: AppColors.whiteColor,
                height: 70,
                child:  CustomTabBar(
                  onChange: (index) {
                    setState(() {
                      selected = tabs[index];
                    });
                  },
                  tabs: const [
                    'Discussion',
                    'Images & videos',
                    "Members",
                  ],


                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20).r,
                      child:  selected,);
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

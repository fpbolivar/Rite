import 'package:rite_funeral_flutter/Domain/Model/Community/groups_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/round_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/search_text_fields.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/groups_tiles.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/add_community.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/community_details.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/sliver_app_bar_bacground.dart';
import 'package:rite_funeral_flutter/imports.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  ScrollController controller = ScrollController();

  ValueNotifier<bool> isHideHeader = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listener();
  }

  _listener() async {
    controller.addListener(() {
      if (controller.hasClients) {
        isHideHeader.value = controller.offset > 110;
      }
    });
  }

  List<GroupModel> modelData = [
    GroupModel(
        image: 'assets/images/group1.png',
        title: 'Serene Sympathy Circle',
        desc:
            'Lorem ipsum dolor sit amet consectetur. Enim sit consectetur turpis et id ac.',
        payment: '\$3000',
        posts: '1.2k posts',
        user: '1.4k'),
    GroupModel(
        image: 'assets/images/group1.png',
        title: 'Serene Sympathy Circle',
        desc:
            'Lorem ipsum dolor sit amet consectetur. Enim sit consectetur turpis et id ac.',
        payment: '\$3000',
        posts: '1.2k posts',
        user: '1.4k'),
    GroupModel(
        image: 'assets/images/onboard1.png',
        title: 'Remembrance Reflection Group',
        desc:
            'Lorem ipsum dolor sit amet consectetur. Enim sit consectetur turpis et id ac.',
        payment: '\$5000',
        posts: '1.4k posts',
        user: '1.1k'),
    GroupModel(
        image: 'assets/images/onboard2.png',
        title: 'Funeral planning (Private)',
        desc:
            'Lorem ipsum dolor sit amet consectetur. Enim sit consectetur turpis et id ac.',
        payment: '\$4000',
        posts: '1.2k posts',
        user: '800'),
    GroupModel(
        image: 'assets/images/onboard2.png',
        title: 'Funeral planning (Private)',
        desc:
            'Lorem ipsum dolor sit amet consectetur. Enim sit consectetur turpis et id ac.',
        payment: '\$4000',
        posts: '1.2k posts',
        user: '800'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigate.to(context, AddCommunity());
        },
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            floating: true,
            pinned: true,
            snap: false,
            toolbarHeight: 40,
            expandedHeight: 230,
            collapsedHeight: 40,
            leadingWidth: MediaQuery.sizeOf(context).width,
            // leading:
            // floating: true,
            bottom: const RoundAppBar(backgroundColor: Colors.white,height: 30,),
            flexibleSpace: SliverAppBarBackground(
              height: 290.sp,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.y,
                      AppText("Funeral forum",
                          style: Styles.medium(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                      20.y,
                      SearchTextField(
                        borderRadius: 10.sp,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 13.sp),
                        height: 50.sp,
                        hintText: 'Search vendor',
                        hintStyle: Styles.medium(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColors.greyTextColor,
                        ),
                        prefixIcon: SvgPicture.asset(Assets.search),
                        textInputType: TextInputType.text,
                        filledColor: AppColors.whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.y,
                      AppText(
                        'Groups',
                        style: Styles.medium(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.medium,
                        ),
                      ),
                      20.y,
                      ListView.separated(
                          padding: EdgeInsets.only(bottom: 20.sp),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigate.to(
                                      context,  CommunityDetails(
                                    groupModel: modelData[index],
                                  ));
                                },
                                child: GroupTile(
                                  groups: modelData[index],
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return 20.y;
                          },
                          itemCount: modelData.length)
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

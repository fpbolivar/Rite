import 'package:rite_funeral_flutter/Domain/Model/Community/groups_model.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/round_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/TextFormFields/search_text_fields.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/progress_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/Components/groups_tiles.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/add_community.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/community_details.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Donation/add_donation.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/sliver_app_bar_bacground.dart';
import 'package:rite_funeral_flutter/imports.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigate.to(context, AddDonation());
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
            expandedHeight: 240,
            collapsedHeight: 40,
            leadingWidth: MediaQuery.sizeOf(context).width,
            // leading:
            // floating: true,
            bottom: const RoundAppBar(
              backgroundColor: Colors.white,
              height: 30,
            ),
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
                      60.y,
                      AppText("Honor their memory with a gift\nof love.",
                          maxLine: 2,
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
                        hintText: 'Search donation',
                        hintStyle: Styles.regular(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
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
                        'Urgent donations',
                        style: Styles.medium(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.medium,
                        ),
                      ),
                      10.y,
                      CacheImage(
                        url: 'assets/images/onboard1.png',
                        height: 150.sp,
                        width: 1.sw,
                        radius: BorderRadius.circular(20.sp),
                      ),
                      SizedBox(
                          width: 1.sw,
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
                                          padding:
                                              const EdgeInsets.only(left: 13).r,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: AppText(
                                            '10,00+ people donated',
                                            style: Styles.medium(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13.sp),
                                          ),
                                        )),
                            ],
                          )),
                      AppText(
                        'In Loving Memory of Eddie Heptinstall',
                        style: Styles.medium(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                      5.y,
                      const ProgressBar(total: 10000,target: 3000),
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

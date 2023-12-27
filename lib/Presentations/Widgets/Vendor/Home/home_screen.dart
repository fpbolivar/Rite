import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/CheckList/check_list.dart';
import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/app_drawer.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/round_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Checks/app_check.dart';
import 'package:rite_funeral_flutter/Presentations/Common/FunctionWidget/customBottomSheet.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Notifications/notifications.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/ChechList/check_list.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/sliver_app_bar_bacground.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Home/Components/analytics.dart';
import 'package:rite_funeral_flutter/imports.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({super.key});

  @override
  State<VendorHome> createState() => _HomeState();
}

class _HomeState extends State<VendorHome> {
  ScrollController controller = ScrollController();
  ValueNotifier<bool> isHideHeader = ValueNotifier(false);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listener();
  }

  String? image;
  _listener() async {
    controller.addListener(() {
      if (controller.hasClients) {
        isHideHeader.value = controller.offset > 110;
      }
    });
  }

  List<String> titles = [
    "Research venues",
    "Research funeral sites",
    "Invite guests",
  ];

  List<bool> check = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];


  List<String> checks = ['Research venues',"Research funeral sites",'Invite guests'];

  List<Map<String, dynamic>> list = [
    {
      'image': Assets.wallet,
      'price': "\$15,892",
      'title': 'Total earning',
    },
    {
      'image': Assets.booking,
      'price': "15",
      'title': 'Total Booking',
    },
    {
      'image': Assets.starB,
      'price': "10",
      'title': 'Total reviews',
    },
    {
      'image': Assets.callBold,
      'price': "10",
      'title': 'View telephone',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white, size: 26),
        actions: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  size: 26,
                  color: Colors.white,
                )),
          ),
          0.67.sw.x,
          IconButton(
              onPressed: () {
                Navigate.to(context, Notifications());
              },
              icon: const Icon(
                Icons.notifications,
                size: 26,
                color: Colors.white,
              )),
        ],
      ),
      drawerEnableOpenDragGesture: true,
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
            expandedHeight: 120,
            collapsedHeight: 60,
            leadingWidth: MediaQuery.sizeOf(context).width,
            // leading:

            // floating: true,
            bottom: const RoundAppBar(
              height: 30,
              backgroundColor: Colors.white,
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
              // height: 70,
            ),
            flexibleSpace: SliverAppBarBackground(
              height: 310,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  60.y,
                  if (image != null)
                    CacheImage(
                      url: '',
                      width: 65,
                      height: 65,
                      radius: BorderRadius.circular(65 / 2),
                    ),
                  AppText("Bloom Emporium",
                      style: Styles.medium(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  5.y,
                  AppText("Funeral Flower Supplier",
                      style: Styles.medium(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.y,
                      SizedBox(
                        height: 280.h,
                        width: 1.sw,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                         padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,childAspectRatio: 1.2,mainAxisSpacing: 15,
                                crossAxisSpacing: 15,),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.sp),
                              width: 200.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: AppColors.primary.withOpacity(0.1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  25.y,
                                  SvgPicture.asset(
                                    list[index]['image'],
                                    height: 32.sp,
                                    width: 32.sp,
                                    colorFilter: const ColorFilter.mode(

                                      AppColors.primary,
                                      BlendMode.srcIn),),
                                  12.y,
                                  AppText(
                                    list[index]['price'],
                                    style: Styles.medium(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  3.y,
                                  AppText(
                                    list[index]['title'],
                                    style: Styles.medium(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      AppText('Check List',style: Styles.medium(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),),
                      10.y,
                      for (int i = 0; i < titles.length; i++)
                      CheckAndTitleTile(
                        value: check[i],
                        title: titles[i],
                        mainAxisAlignment: MainAxisAlignment.start,
                        onChanged: (vl) => _onChange(vl, i),
                      ),
                      10.y,
                      CustomButton(
                        onTap: () {
                          CustomBottomSheet().showBottomSheet(context,  Analytics());
                      }, text: 'View all checklist',

                      borderColor: AppColors.greyTextColor,
                        textColor: AppColors.greyTextColor,
                        bgColor: AppColors.whiteColor,
                        isBorder: true,
                        horizontalMargin: 10.sp,
                        leadingSvgIcon: true,
                        gapWidth: 20.sp,

                        trailingIcon
                        : 'assets/icons/arrow.svg',
                      ),
                      30.y,
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

  _onChange(bool? val, int index) {
    setState(() {
      check[index] = val ?? false;
    });
  }
}


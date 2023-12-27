import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/app_drawer.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/round_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Notifications/notifications.dart';
import 'package:rite_funeral_flutter/Presentations/Common/duration_timer.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/Guests/horizontal_guests.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/MyVendors/horizontal_vendors.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/Person/add_person.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/add_venues.dart';
import 'package:rite_funeral_flutter/imports.dart';
import 'Components/ChechList/check_list.dart';
import 'Components/horezontal_list.dart';
import 'Components/sliver_app_bar_bacground.dart';

class Home extends StatefulWidget {
   const Home({super.key});




  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      // drawer: const AppDrawer(
      // ),
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
            expandedHeight: 230,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (image != null)
                    CacheImage(
                      url: '',
                      width: 65,
                      height: 65,
                      radius: BorderRadius.circular(65 / 2),
                    ),
                  AppText("Adam's Funeral",
                      style: Styles.medium(fontSize: 18, color: Colors.white)),
                  if (image == null)
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: AppButton(
                        onPressed: () =>
                            Navigate.to(context, const AddPerson()),
                        title: "Get Started",
                        borderColor: AppColors.divider,
                        backgroundColor: Colors.black12,
                        height: 45,
                        width: 200,
                      ),
                    ),
                  20.y,
                  const DurationTimer(),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    const AddVenues(),
                    15.y,
                    const HorizontalList(),
                    const CheckLists(),
                    40.y,
                    const HorizontalVendor(),
                    40.y,
                    const HorizontalGuests(),
                  ],
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

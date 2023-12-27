import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/app_drawer.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Bars/bottom_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Chat/chat.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/community.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Donation/donation.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors.dart';
import 'package:rite_funeral_flutter/imports.dart';
import 'Presentations/Widgets/User/Home/home.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});
  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  PageController controller = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const Home(
           ),
          VendorsScreen(),
          const Community(),
          const ChatScreen(),
         const Donation(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(

        onChange: (int index) {
          controller.jumpToPage(index);
        },
      ),
    );
  }
}

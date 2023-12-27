import 'package:rite_funeral_flutter/Presentations/Common/Bars/bottom_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Chat/chat.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Community/community.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/home.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Billing/billing.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Booking/booking_screen.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Drawer/vendor_drawer.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Home/home_screen.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/store_front.dart';
import 'package:rite_funeral_flutter/imports.dart';

class VendorBottomBar extends StatefulWidget {
  const VendorBottomBar({super.key});
  @override
  State<VendorBottomBar> createState() => _VendorBottomBarState();
}

class _VendorBottomBarState extends State<VendorBottomBar> {
  PageController controller = PageController();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const VendorDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const VendorHome(),
        StoreFront(),
          const ChatScreen(),
          const BookingScreen(),
          Billing(),
          // const Donation(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        newItems: [
          BarItem(
            size: Size(20.sp, 20.sp),
            icon: Assets.home,
            text: 'Home',
            activeIcon: Assets.home,
            index: 0,
            selectedIndex: selectedIndex,
            onTap: onSelect,
          ),
          BarItem(
            size: Size(19.sp, 19.sp),
            icon: Assets.store,
            activeIcon: Assets.store,
            text: 'Storefront',
            index: 1,
            selectedIndex: selectedIndex,
            onTap: onSelect,
          ),
          BarItem(
            size: Size(20.sp, 20.sp),
            text: "Chat",
            icon: Assets.chat,
            activeIcon: Assets.chat,
            index: 2,
            selectedIndex: selectedIndex,
            onTap: onSelect,
          ),
          BarItem(
            size: Size(20.sp, 20.sp),
            icon: Assets.booking,
            text: 'Booking',
            activeIcon:  Assets.booking,
            index:3,
            selectedIndex: selectedIndex,
            onTap: onSelect,
          ),
          BarItem(
            size: Size(20.sp, 20.sp),
            icon: Assets.wallet,
            text: 'Billing',
            activeIcon:  Assets.wallet,
            index:4,
            selectedIndex: selectedIndex,
            onTap: onSelect,
          )
        ],
        onChange: (int index) {
          controller.jumpToPage(index);
        },
      ),
    );
  }

  void onSelect(index) {
    setState(() {
      selectedIndex = index;
    });
    controller.jumpToPage(index);
}
}

class BarItem<T> extends StatelessWidget {
  const BarItem(
      {required this.icon,
      required this.activeIcon,
      required this.index,
      required this.selectedIndex,
      required this.onTap,
      this.text,
      this.size,
      this.counts,
      this.theme,
      super.key});

  final Size? size;
  final T? icon;
  final T? activeIcon;
  final String? text;
  final void Function(int index) onTap;
  final int index;
  final int selectedIndex;
  final ValueNotifier<int>? counts;
  final BottomNavigationBarThemeData? theme;

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarThemeData? _theme =
        theme ?? Theme.of(context).bottomNavigationBarTheme;
    late ValueNotifier<int> count = counts ?? ValueNotifier(0);

    bool selected = index == selectedIndex;

    double _width = size?.width ??
        (selected
            ? _theme.selectedIconTheme?.size
            : _theme.unselectedIconTheme?.size)!;

    double _height = size?.height ??
        (selected
            ? _theme.selectedIconTheme?.size
            : _theme.unselectedIconTheme?.size)!;

    late dynamic _icon = selected ? activeIcon : icon;

    late String? extension;

    if (icon is String) {
      extension = (selected ? activeIcon : icon).toString().split('.').last;
    }
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ValueListenableBuilder(
          valueListenable: count,
          builder: (context, counts, child) => Badge(
            isLabelVisible: counts > 0,
            label: Text(
              "${counts < 100 ? counts : "99+"}",
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: _width,
                    height: _height,
                    child:
                        (_icon is String && extension?.toLowerCase() == "svg")
                            ? SvgPicture.asset(
                                _icon,
                                width: _width,
                                height: _height,
                                colorFilter: ColorFilter.mode(
                                    selected
                                        ? _theme.selectedItemColor ??
                                            AppColors.primary
                                        : _theme.unselectedItemColor ??
                                            AppColors.greyTextColor,
                                    BlendMode.srcIn),
                              )
                            : (_icon is String)
                                ? Image.asset(_icon,
                                    width: _width,
                                    height: _height,
                                    color: selected
                                        ? _theme.selectedItemColor
                                        : _theme.unselectedItemColor)
                                : Icon(
                                    _icon,
                                    size: _height,
                                    weight: 1,
                                    color: selected
                                        ? _theme.selectedItemColor
                                        : _theme.unselectedItemColor,
                                  )),
                if (text != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      text!,
                      overflow: TextOverflow.fade,
                      style: selected
                          ? _theme.selectedLabelStyle
                          : _theme.unselectedLabelStyle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

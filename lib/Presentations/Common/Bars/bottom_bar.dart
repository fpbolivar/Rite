import 'package:rite_funeral_flutter/imports.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    Key? key,
    this.newItems,
    this.centerItemText,
    this.height = 65.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    required this.onChange,
  }) : super(key: key);

  ///List of [BarItem]
  final List<Widget>? newItems;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final void Function(int index) onChange;

  @override
  State<StatefulWidget> createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  @override
  void initState() {
    super.initState();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: widget.height,
      padding: const EdgeInsets.all(2),
      elevation: 0,
      shadowColor: Theme.of(context).bottomAppBarTheme.shadowColor,
      color: widget.backgroundColor ??
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.newItems ??
            [
              BarItem(
                icon: Assets.documents,
                activeIcon: Assets.documents,
                text: 'Home',
                index: 0,
                selectedIndex: currentPageIndex,
                onTap: onSelect,
              ),
              BarItem(
                selectedIndex: currentPageIndex,
                icon: Assets.vender,
                activeIcon: Assets.vender,
                text: 'Vendors',
                index: 1,
                onTap: onSelect,
              ),
              BarItem(
                selectedIndex: currentPageIndex,
                icon: Assets.comunity,
                activeIcon: Assets.comunity,
                text: 'Community',
                index: 2,
                size: Size(20.sp, 20.sp),
                onTap: onSelect,
              ),
              BarItem(
                selectedIndex: currentPageIndex,
                icon: Assets.chat,
                activeIcon: Assets.chat,
                text: 'Chat',
                index: 3,
                onTap: onSelect,
              ),
              BarItem(
                selectedIndex: currentPageIndex,
                icon: Assets.donation,
                activeIcon: Assets.donation,
                text: 'Donation',
                index: 4,
                onTap: onSelect,
                  counts: ValueNotifier(0),
              ),

              // BarItem(
              //   icon: Icons.home_outlined,
              //   activeIcon: Icons.home,
              //   text: 'Home',
              //   index: 0,
              //   selectedIndex: currentPageIndex,
              //   onTap: onSelect,
              // ),
              // BarItem(
              //   icon: Icons.search,
              //   activeIcon: Icons.search,
              //   text: 'Search',
              //   index: 1,
              //   selectedIndex: currentPageIndex,
              //   onTap: onSelect,
              // ),
              // BarItem(
              //   icon: Icons.access_time,
              //   activeIcon: Icons.access_time_filled,
              //   text: 'Hello',
              //   index: 2,
              //   selectedIndex: currentPageIndex,
              //   onTap: onSelect,
              // ),
              // BarItem(
              //   icon: Icons.message,
              //   activeIcon: Icons.messenger_outlined,
              //   text: 'Inbox',
              //   index: 3,
              //   selectedIndex: currentPageIndex,
              //   onTap: onSelect,
              // ),
              // BarItem(
              //   icon: Icons.person_outlined,
              //   activeIcon: Icons.person,
              //   text: 'Profile',
              //   index: 4,
              //   selectedIndex: currentPageIndex,
              //   onTap: onSelect,
              //   counts: ValueNotifier(0),
              // ),
            ],
      ),
    );
  }

  void onSelect(index) {
    setState(() {
      currentPageIndex = index;
    });
    widget.onChange(index);
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
                                        ? _theme.selectedItemColor?? AppColors.primary
                                        : _theme.unselectedItemColor?? AppColors.greyTextColor,
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

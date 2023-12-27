import 'package:rite_funeral_flutter/imports.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    this.isBrokerScreen,
     this.list,
    required this.tabs,
    this.onChange,
    this.margin,
    super.key,
  });

  final List<Widget>? list;
  final List<String> tabs;
  final bool? isBrokerScreen;
  final Function(int index)? onChange;
  final double? margin;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.y,
        SizedBox(
          height: 45,
          width: MediaQuery.sizeOf(context).width,
          child: Center(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.tabs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _Tile(
                      onTap: () =>setState((){
                        selected=index;
                        if(widget.onChange != null) widget.onChange!(index);
                      },),
                      isSelected: index==selected,
                      title: widget.tabs[index],
                    )),
          ),
        ),
        10.y,
        if(widget.list != null)
        widget.list![selected]
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.onTap,
    required this.isSelected,
    required this.title,
  });
  final void Function() onTap;
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: AppText(
              title,
              style: Styles.medium(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: isSelected ? AppColors.medium : AppColors.greyTextColor,
              ),
            ),
          ),
          10.y,
          Container(
            height: 2.sp,
            width: 80.sp,
            decoration: BoxDecoration(
              color:isSelected ?  AppColors.light:AppColors.borderColor,
              borderRadius: BorderRadius.circular(10.sp),
            ),
          ),
        ],
      ),
    );
  }
}

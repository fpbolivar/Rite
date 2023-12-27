import 'package:rite_funeral_flutter/imports.dart';

class CrossButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CrossButtonAppBar(
      {required this.title,
      this.bgColor,
      this.height,
      this.padding,
      this.onClose,
      Key? key})
      : preferredSize = const Size.fromHeight(65),
        super(key: key);
  final String title;
  final double? height;
  final Color? bgColor;
  final void Function()? onClose;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 5),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              title,
              style: Styles.bold(fontSize: 18,),
            ),
            InkWell(
              onTap: onClose ??
                  () {
                    Navigate.pop(context);
                  },
              child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close_outlined,
                    color: Colors.black87,
                    size: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  final Size preferredSize;
}

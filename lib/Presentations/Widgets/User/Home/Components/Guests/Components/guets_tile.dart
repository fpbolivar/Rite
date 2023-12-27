import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class GuestTile extends StatefulWidget {
  const GuestTile(
      {required this.name, this.image, required this.status, super.key});
  final String name;
  final String status;
  final String? image;

  @override
  State<GuestTile> createState() => _GuestTileState();
}

class _GuestTileState extends State<GuestTile> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        15.x,
        Container(
          margin: EdgeInsets.only(top: 5.sp,bottom: 5.sp),
          decoration: const BoxDecoration(
            color: AppColors.textFieldColor,
            shape: BoxShape.circle,
          ),
          width: 80,
          height: 80,
          alignment: Alignment.center,
          child: widget.image != null
              ? CacheImage(
            isCircle: true,
            url: widget.image!,
            width: 95,
            height: 95,
          )
              : AppText(
            widget.name[0],
            style: Styles.medium(
                fontSize: 24,
                color: AppColors.primary.withOpacity(0.4)),
          ),
        ),
        20.x,
        Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          AppText(
            widget.name,
            style: Styles.medium(fontSize: 16),
          ),
          AppText(
            widget.status,
            style: Styles.light(fontSize: 12),
          ),
        ],)
      ],
    );
  }
}

import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.sizeOf(context).width,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ServiceCountTile(),
          ServiceCountTile(),
          ServiceCountTile(),
        ],
      ),
    );
  }
}

class ServiceCountTile extends StatelessWidget {
  const ServiceCountTile({this.counts, super.key});
  final String? counts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CacheImage(
            url:
                "https://3dmodels.org/wp-content/uploads/2016/07/26/roblp_600_lq_0001.jpg",
            height: 90,
            width: 90,
            radius: BorderRadius.circular(8),
          ),
          3.y,
          AppText("CheckList",
              style: Styles.medium(fontSize: 14, color: Colors.black)),
          1.y,
          AppText(counts ?? "1/25",
              style:
                  Styles.light(fontSize: 12, color: const Color(0xff868686))),
        ],
      ),
    );
  }
}

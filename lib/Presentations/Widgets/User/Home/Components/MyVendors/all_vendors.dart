import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class AllVendorsList extends StatefulWidget {
  const AllVendorsList({super.key});

  @override
  State<AllVendorsList> createState() => _AllVendorsListState();
}

class _AllVendorsListState extends State<AllVendorsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: BackArrowWidget(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        centerTitle: true,
        title: AppText(
          "Add Vendors",
          style: Styles.bold(fontSize: 17),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => const AllVendorTile()),
    );
  }
}

class AllVendorTile extends StatefulWidget {
  const AllVendorTile({this.name, this.image, this.status, super.key});
  final String? name;
  final String? status;
  final String? image;

  @override
  State<AllVendorTile> createState() => _AllVendorTileState();
}

class _AllVendorTileState extends State<AllVendorTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: AppColors.primary.withOpacity(0.2),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.divider.withOpacity(0.1),
              borderRadius: BorderRadius.circular(35),
            ),
            width: 55,
            height: 55,
            alignment: Alignment.center,
            child: widget.image != null
                ? CacheImage(
                    url: widget.image!,
                    radius: BorderRadius.circular(35),
                    width: 55,
                    height: 55,
                  )
                : const Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.black87,
                  ),
          ),
        ],
      ),
      title: AppText(
        "Flowers",
        style: Styles.medium(fontSize: 16),
      ),
      subtitle: AppText(
        "Browse vendors",
        style: Styles.light(fontSize: 12),
      ),
    );
  }
}

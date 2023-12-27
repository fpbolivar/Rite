import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Vendors/vendors_search.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'all_vendors.dart';

class HorizontalVendor extends StatelessWidget {
  const HorizontalVendor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "My Vendors",
            style: Styles.bold(fontSize: 18),
          ),
          10.y,
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => RoundVendorTile()),
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              onPressed: () {
                Navigate.to(context, VendorsScreen());
              },
              title: "View all vendors",
              backgroundColor: Colors.white,
              textColor: Colors.black38,
              trailing: const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black38,
                  size: 15,
                ),
              ),
              borderColor: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundVendorTile extends StatelessWidget {
  const RoundVendorTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.to(context, const AllVendorsList());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                  color: Color(0xffF2F2F2), shape: BoxShape.circle),
              child: CacheImage(
                url: "assets/icons/plus.svg",

                height: 17,
                width: 17,
                fit: BoxFit.contain,
                radius: BorderRadius.circular(40),
              ),
            ),
            3.y,
            AppText("Vendor",
                style: Styles.medium(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
          ],
        ),
      ),
    );
  }
}

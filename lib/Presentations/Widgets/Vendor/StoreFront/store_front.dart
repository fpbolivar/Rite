import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/Presentations/Common/pop_menu.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/add_business_details.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/boost_business.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/deals.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/images_videos.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/location_map.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/payment_method.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/pop_menu.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/price_services.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/Components/socail_links.dart';
import 'package:rite_funeral_flutter/imports.dart';

class StoreFront extends StatelessWidget {
   StoreFront({super.key});


  List<Map<String, dynamic>> list = [
    {
      'image': "assets/images/business_d.png",
      'price': "\$15,892",
      'title': 'Business details',
      'class': AddBusinessDetails(),
    },
    {
      'image': "assets/images/price_service.png",
      'price': "15",
      'title': 'Price & Services',
      "class":const PriceAndServices(),
    },
    {
      'image': "assets/images/loc_map.png",
      'price': "10",
      'title': 'Location on map',
      'class':LocationAndMap(),
    },
    {
      'image': "assets/images/photo_video.png",
      'price': "10",
      'title': 'Photo & Videos',
      'class': ImagesAndVideos(),
    },
    {
      'image': "assets/images/sale.png",
      'price': "10",
      'title': 'Deals',
      'class': Deals()
    },
    {
      'image': "assets/images/socail_links.png",
      'price': "10",
      'title': 'Social link',
      'class':SocailLinks(),
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        actions: [
        const  StorePop(),
          15.x,
        ],
        automaticallyImplyLeading: false,
        title: AppText(
          'Add business info',style: Styles.medium(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: AppColors.light
,        ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: Column(
          children: [
            15.y,
            SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: list.length,
                padding: EdgeInsets.zero,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 1.3,mainAxisSpacing: 10,
                  crossAxisSpacing: 8,),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigate.to(context,   list[index]['class'],);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      width: 200.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         AssetImageWidget(
                           url:
                            list[index]['image'],
                            height: 100.sp,
                            width: 200.sp,
                            ),
                          3.y,
                          AppText(
                            list[index]['title'],
                            style: Styles.regular(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/add_image_widget.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

class ImagesAndVideos extends StatelessWidget {
   ImagesAndVideos({super.key});


  List<String> list = [
      "assets/images/onboard1.png",


    "assets/images/price_service.png",

    "assets/images/loc_map.png",

    "assets/images/photo_video.png",

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CrossButtonAppBar(
      title: 'Photos & videos',
      onClose: () {
        Navigator.pop(context);
      },
    ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            10.y,
            AddImageWidget(
              height: 100.sp,
              onTap: () {

            },),
            20.y,
            SizedBox(
              height: 0.60.sh,
              width: 1.sw,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: list.length,
                padding: EdgeInsets.zero,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,childAspectRatio: 1.1,mainAxisSpacing: 10,
                  crossAxisSpacing: 8,),
                itemBuilder: (context, index) {
                  return AssetImageWidget(

                    radius: 20.sp,
                    url:
                    list[index],
                    height: 300.sp,
                    width: 200.sp,
                  );
                },
              ),
            ),
            CustomButton(onTap: () {

            }, text: 'Save')
          ],
        ),
      ),
    );

  }
}

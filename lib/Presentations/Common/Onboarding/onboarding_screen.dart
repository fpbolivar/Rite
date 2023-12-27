import 'package:rite_funeral_flutter/Presentations/Common/Auth/Login/login_screen.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/asset_image.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/home.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Auth/Login/login_screen.dart';
import 'package:rite_funeral_flutter/frame.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'Controllers/scroll_notifier.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> images = [
    'assets/images/onboard1.png',
    'assets/images/onboard2.png',
    'assets/images/onboard3.png',
  ];

  final List<String> vendorSide = [
    'assets/images/onboard_v_1.png',
    'assets/images/onboard_v_2.png',
    'assets/images/onboard_v_2.png',
  ];

  final List<String> titles = [
    "Elevate Your Presence and Maximize Opportunities Through Our Vendor Platform.",
    "Navigate Your Business with Intuitive Tools Tailored for Vendors",
    "Experience Smooth Transactions and Boost Your Bottom Line"
  ];


  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 1.sw,
                child: AssetImageWidget(
                  height: 491.sp,
                  width: 1.sw,
                  url: vendorSide[_currentIndex],
                ),
              ),
              Positioned(
                left: 0.40.sw,
                bottom: 10.sp,
                child: Container(
                  padding: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      vendorSide.length,
                      (index) => Container(
                        width:
                           _currentIndex == index ? 10 : 8,
                        height:
                           _currentIndex == index ? 10 : 8,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppColors.primary
                              : AppColors.light,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               _currentIndex == 0 ?10.y:20.y,
                AppText(titles[_currentIndex],
                    maxLine: 3,
                    style: Styles.bold(
                      fontSize: 18.sp,
                    )),
                50.y,
                CustomButton(
                  onTap: () {
                    if (_currentIndex == images.length - 1) {
                      Navigate.to(
                          context,
                          const VendorLogin(
                          ));
                    } else {
                      _currentIndex++;
                    }
                    setState(() {});
                  },
                  text: 'Next',
                  gapWidth: 10,
                ),
                20.y,
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigate.to(
                          context,
                          const VendorLogin(
                          ));
                    },
                    child: AppText('Skip',
                        maxLine: 2,
                        style: Styles.medium(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

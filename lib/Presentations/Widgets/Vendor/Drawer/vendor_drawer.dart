import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/Components/tiles.dart';
import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/ChangePassword/change_password.dart';
import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/CustomerSupport/customer_support.dart';
import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/Profile/edit_profile.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/BottomBar/bottom_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/StoreFront/store_front.dart';
import 'package:rite_funeral_flutter/imports.dart';

class VendorDrawer extends StatefulWidget {
  const VendorDrawer({super.key});

  @override
  State<VendorDrawer> createState() => _VendorDrawerState();
}

class _VendorDrawerState extends State<VendorDrawer> {
  String? image;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          children: [
            50.y,
            CacheImage(
                url: Assets.image,
                height: 110.sp,
                width: 110.sp,
                radius: BorderRadius.circular(80)),
            10.y,
            AppText('Alexander Mason',
                style: Styles.bold(
                  fontSize: 20.sp,
                  color: AppColors.bold,
                )),
            5.y,
            InkWell(
              onTap: () {
                Navigate.to(context, const EditProfile());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50.sp),
                padding: EdgeInsets.symmetric(vertical: 4.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: AppColors.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.edit),
                    10.x,
                    AppText('Edit Profile',
                        style: Styles.medium(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.whiteColor,
                        )),
                  ],
                ),
              ),
            ),
            30.y,
            TabsTiles(
              title: 'Home',
              image: Assets.homeLight,
              onTap: () {
                Navigate.to(context, const VendorBottomBar());
              },
            ),
            30.y,
            TabsTiles(
              title: 'My Store Front',
              image: Assets.anlytics,
              onTap: () {
                Navigate.to(context,  StoreFront());
              },
            ),
            30.y,
            // TabsTiles(
            //   title: 'Notifications',
            //   image: Assets.notification,
            //   onTap: () {
            //     Navigate.to(context, Notifications());
            //   },
            // ),
            // 25.y    25.y,
            TabsTiles(
              title: 'Change Password',
              image: Assets.lock,
              onTap: () {
                Navigate.to(context, const ChangePassword());
              },
            ),
            30.y,
            TabsTiles(
              title: 'Rate on plays tore',
              image: Assets.star,
              onTap: () {},
            ),
            30.y,
            TabsTiles(
              isLogout: false,
              title: 'Log Out',
              image: Assets.logout,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

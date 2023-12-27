import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/Components/tiles.dart';
import 'package:rite_funeral_flutter/Presentations/Common/AppDrawer/DrawerScreen/CustomerSupport/customer_support.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Images/cache_image.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../Notifications/notifications.dart';
import 'DrawerScreen/ChangePassword/change_password.dart';
import 'DrawerScreen/CheckList/check_list.dart';
import 'DrawerScreen/Profile/edit_profile.dart';
import 'DrawerScreen/Saved/my_saved.dart';
import 'DrawerScreen/SetPaymentMethod/set_payment_method.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
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
              title: 'My Plans',
              image: Assets.calender,
              onTap: () {
                Navigate.to(context, CheckList());
              },
            ),
            25.y,
            TabsTiles(
              title: 'Contact Support',
              image: Assets.call,
              onTap: () {
                Navigate.to(context, const CustomerSupport());
              },
            ),
            25.y,
            TabsTiles(
              title: 'Payment method',
              image: Assets.card,
              onTap: () {
                Navigate.to(context, const SetPaymentMethod());
              },
            ),
            25.y,
            TabsTiles(
              title: 'Privacy policy',
              image: Assets.calender,
              onTap: () {},
            ),
            25.y,
            // TabsTiles(
            //   title: 'Notifications',
            //   image: Assets.notification,
            //   onTap: () {
            //     Navigate.to(context, Notifications());
            //   },
            // ),
            // 25.y,
            TabsTiles(
              title: 'Favourite',
              image: Assets.heart,
              onTap: () {
                Navigate.to(context, MySaved());
              },
            ),
            25.y,
            TabsTiles(
              title: 'Change Password',
              image: Assets.lock,
              onTap: () {
                Navigate.to(context, const ChangePassword());
              },
            ),
            25.y,
            TabsTiles(
              title: 'Rate on plays tore',
              image: Assets.star,
              onTap: () {},
            ),
            25.y,
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

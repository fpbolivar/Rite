import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/Guests/invite_guests.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'add_guests.dart';
import 'all_guests.dart';

class HorizontalGuests extends StatelessWidget {
  const HorizontalGuests({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "Guest list",
                style: Styles.bold(fontSize: 18),
              ),
              InkWell(
                onTap: () => Navigate.to(context, AllGuests()),
                child: AppText(
                  "View all",
                  style: Styles.light(fontSize: 16),
                ),
              ),
            ],
          ),
           const Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _Tile(
                icon:"assets/icons/2user.svg",
                title: "All Guests",
              ),
              _Tile(
                icon: Icons.check_box_rounded,
                title: "Confirmed",
              ),
              _Tile(
                icon: Icons.check_box_rounded,
                title: "Pending",
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              onPressed: () => Navigate.to(context, const AddGuest()),
              title: "Add Guests",
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

class _Tile extends StatelessWidget {
  const _Tile(
      {required this.icon, required this.title, this.count = "0", super.key});
  final dynamic icon;
  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.to(context, const InviteGuests());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xffF2F2F2),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon is IconData
                        ? Icon(
                            icon,
                            size: 17,
                            color: AppColors.primary,
                          )
                        : icon is String
                            ? icon.split(".").last.toLowerCase() == "svg"
                                ? SvgPicture.asset(
                                    icon,
                                    width: 17,
                                    height: 17,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.primary, BlendMode.srcIn),
                                  )
                                : Image.asset(
                                    icon,
                                    width: 17,
                                    height: 17,
                                    color: AppColors.primary,
                                  )
                            : 0.y,
                    2.x,
                    AppText(
                      count,
                      style: Styles.regular(
                          fontSize: 18, color: AppColors.primary),
                    )
                  ],
                ),
              ),
            ),
            3.y,
            AppText(title,
                style: Styles.medium(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:rite_funeral_flutter/Presentations/Common/Bars/app_bar_with_cross.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../../Domain/Model/Notifications/notification_model.dart';
import 'Components/notification_tile.dart';

class Notifications extends StatelessWidget {
  Notifications({super.key});

  final List<NotificationsModel> chatData = [
    NotificationsModel(
        subtitle: 'You received new message from Gaberial',
        messageLength: '1',
        title: 'New chat',
        pr0fileImage: 'assets/icons/notification.svg',
        time: '3 day ago'),
    NotificationsModel(
        subtitle: 'You received new message from Gaberial',
        messageLength: '',
        title: 'New Listing',
        pr0fileImage: 'assets/icons/notification.svg',
        time: '1 day ago'),
    NotificationsModel(
        subtitle: 'Hello How Are Your',
        messageLength: '3',
        title: 'New Chat',
        pr0fileImage: 'assets/icons/notification.svg',
        time: '1 day ago'),
    NotificationsModel(
        subtitle: 'New Business has been listed in market',
        messageLength: '',
        title: 'New Listing',
        pr0fileImage: 'assets/icons/notification.svg',
        time: '1 day ago'),
    NotificationsModel(
        subtitle: 'New Business has been listed in market',
        messageLength: '3',
        title: 'New Chat',
        pr0fileImage: 'assets/icons/notification.svg',
        time: '1 day ago'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MainWidget(
        title: AppStrings.notifications,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              10.y,
              SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NotificationTile(
                        data: chatData[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20.h,
                      );
                    },
                    itemCount: chatData.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

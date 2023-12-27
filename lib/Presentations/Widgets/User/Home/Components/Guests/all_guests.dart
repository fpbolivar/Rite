import 'package:rite_funeral_flutter/Presentations/Common/Bars/cross_button_app_bar.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Buttons/custom_button.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/User/Home/Components/Guests/add_guests.dart';
import 'package:rite_funeral_flutter/imports.dart';

import '../../../../../Common/Images/cache_image.dart';
import 'Components/guets_tile.dart';
import 'add_event.dart';

class AllGuests extends StatefulWidget {
  const AllGuests({super.key});

  @override
  State<AllGuests> createState() => _AllGuestsState();
}

class _AllGuestsState extends State<AllGuests> {
  ValueNotifier<bool> showAppBar = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CrossButtonAppBar(
        title: "All guests",
        bgColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        // controller: controller,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            // foregroundColor: Colors.white,
            floating: true,
            pinned: true,
            // snap: true,
            stretch: true,
            stretchTriggerOffset: 50,
            expandedHeight: 170,
            collapsedHeight: 30,
            leadingWidth: MediaQuery.sizeOf(context).width,
            // leading:
            toolbarHeight: 30,
            onStretchTrigger: () async {
              showAppBar.value = !showAppBar.value;
              return;
            },

            // floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ValueListenableBuilder(
                  valueListenable: showAppBar,
                  builder: (context, state, child) {
                    return state
                        ? Column(
                            children: [
                              80.y,
                              const GuestEvents(),
                            ],
                          )
                        : 0.x;
                  }),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: index == 19 ? 90.0 : 0),
                  child: const GuestTile(
                    name: "Andrew Chill well",
                    status: "Confirmed",
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  CustomButton(
        horizontalMargin: 20.sp,
        onTap: () {
          Navigate.to(context, AddGuest());
        },
        text: "Add Guest",
      ),
    );
  }
}

class GuestEvents extends StatefulWidget {
  const GuestEvents({super.key});

  @override
  State<GuestEvents> createState() => _GuestEventsState();
}

class _GuestEventsState extends State<GuestEvents> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) => index == 0
              ? Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigate.to(context, const AddEvent());
                      },
                      child: Container(
                        width: 90,
                        height: 90,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: AppColors.textFieldColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.greyTextColor)),
                        child: const Icon(
                          Icons.add_circle_outline,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                )
              : const EventTile(
                  counts: "15 out  ",
                )),
    );
  }
}

class EventTile extends StatelessWidget {
  const EventTile({this.counts, super.key});
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
          AppText("Event Tile",
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

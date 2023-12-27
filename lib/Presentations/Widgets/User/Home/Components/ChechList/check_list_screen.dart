import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'add_check_list.dart';
import 'check_list.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({super.key});

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  List<String> titles = [
    "Research venues",
    "Research funeral sites",
    "Determine Burial or Cremation",
    "Choose a Coffin or Urn",
    "Coordinate Floral Arrangements",
    "Provide a Guestbook",
  ];

  List<bool> check = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black87,
        ),
        title:  AppText("Checklist",style: Styles.medium(
          color: AppColors.medium,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (int i = 0; i < titles.length; i++)
              CheckAndTitleTile(
                value: check[i],
                title: titles[i],
                mainAxisAlignment: MainAxisAlignment.start,
                onChanged: (vl) => _onChange(vl, i),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppButton(
        onPressed: () {
          Navigate.to(context, const AddCheckList());
        },
        leading: const Icon(
          Icons.add,
          color: Colors.white,
          size: 15,
        ),
        title: "Add new checklist",
      ),
    );
  }

  _onChange(bool? val, int index) {
    setState(() {
      check[index] = val ?? false;
    });
  }
}

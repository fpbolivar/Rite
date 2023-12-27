import 'package:rite_funeral_flutter/Presentations/Common/Buttons/app_button.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Checks/app_check.dart';
import 'package:rite_funeral_flutter/imports.dart';

import 'check_list_screen.dart';

class CheckLists extends StatefulWidget {
  const CheckLists({this.padding, this.onlyCheckBox, super.key});
  final EdgeInsetsGeometry? padding;
  final bool? onlyCheckBox;
  @override
  State<CheckLists> createState() => _CheckListsState();
}

class _CheckListsState extends State<CheckLists> {
  Map<String, bool> checkList = {
    "venues": false,
    "funeral_sites": false,
    "invite_guest": false
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText("CheckList", style: Styles.medium(
              fontWeight: FontWeight.w600,
              fontSize: 22,color: AppColors.bold)),
          CheckAndTitleTile(
            onlyCheckBox: widget.onlyCheckBox,
            value: checkList['venues'],
            title: 'Research venues',
            onChanged: (val) => _onChange(val, "venues"),
          ),
          CheckAndTitleTile(
            onlyCheckBox: widget.onlyCheckBox,
            value: checkList['funeral_sites'],
            title: 'Research funeral sites',
            onChanged: (val) => _onChange(val, "funeral_sites"),
          ),
          CheckAndTitleTile(
            onlyCheckBox: widget.onlyCheckBox,
            value: checkList['invite_guest'],
            title: 'Invite guests',
            onChanged: (val) => _onChange(val, "invite_guest"),
          ),
          20.y,
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              title: "View all checklist",
              onPressed: () {
                Navigate.to(context, const CheckListScreen());
              },
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

  _onChange(bool? val, String key) {
    setState(() {
      checkList[key] = val ?? false;
    });
  }
}

class CheckAndTitleTile extends StatelessWidget {
  const CheckAndTitleTile(
      {super.key,
      this.onChanged,
      this.value,
      required this.title,
        this.onlyCheckBox,
      this.mainAxisSize,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween});
  final bool? value;
  final String title;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final bool? onlyCheckBox;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppCheck(
          value: value,
          onChanged: onChanged,
        ),
        if (mainAxisAlignment == MainAxisAlignment.start) 25.x,
        Flexible(
          child: onlyCheckBox?? true ? AppText(title,
              overflow: TextOverflow.ellipsis,
              style: Styles.medium(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: value ?? false ? Colors.black45 : null,
                  decoration: value ?? false
                      ? onlyCheckBox != false ? TextDecoration.lineThrough: TextDecoration.none
                      : TextDecoration.none)):
          AppText(title,
              overflow: TextOverflow.ellipsis,
              style: Styles.medium(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: value ?? false ? null : Colors.black45,
                  decoration:  TextDecoration.none))
          ,
        ),
      const  Spacer(),
      ],
    );
  }
}

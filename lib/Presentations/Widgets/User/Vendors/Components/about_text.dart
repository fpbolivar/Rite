import 'package:rite_funeral_flutter/imports.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({super.key, required this.text});

  @override
  _DescriptionTextWidgetState createState() =>  _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = false;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(110, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: secondHalf!.isEmpty
          ?  AppText(firstHalf!,
          maxLine: 3,
          style: Styles.regular(
            fontWeight: FontWeight.w500,
            color: AppColors.textLightColor,
            fontSize: 14.sp,
          ),
      )
          :  Column(
        children: <Widget>[
           AppText(!flag ? ("${firstHalf!}...") : (firstHalf! + secondHalf!),
               maxLine: !flag? 5:10,
               style: Styles.regular(
             fontWeight: FontWeight.w500,
             color: AppColors.textLightColor,
             fontSize: 14.sp,
           )),
           InkWell(
             splashColor: AppColors.whiteColor,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                 AppText(
                  !flag ? "Show more" : "Show less",
                  style:   Styles.medium(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/imports.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key,this.title,required this.body});

  final String? title;
  final Widget? body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 1.sw,
        leading:SizedBox(
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.sp),
            child: Row(
              children: [
                Expanded(
                  child: AppText(title!, style: Styles.bold(
                    fontSize: 18.sp,
                    color: AppColors.bold,
                  )),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(Assets.cross,height: 20.sp,width: 20.sp,)),
              ],),
          ),
        ),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child:  body,
      ),
    );
  }
}

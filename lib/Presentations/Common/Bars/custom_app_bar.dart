import 'package:rite_funeral_flutter/imports.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,this.title});

final  String? title;

  @override
  Widget build(BuildContext context) {
    return  Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: BackArrowWidget()),
        AppText(title??"", style: Styles.bold(
          fontSize: 18.sp,
        )),
        const Spacer(),
      ],);
  }
}

import 'package:flutter_svg/flutter_svg.dart';
import 'package:rite_funeral_flutter/imports.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key,this.assets});

final  String? assets;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.sp,
      width: 60.sp,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color:AppColors.textFieldColor,
      ),
      child: Center(child: SvgPicture.asset(assets!)),
    );
  }
}

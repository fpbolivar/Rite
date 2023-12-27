import 'package:rite_funeral_flutter/imports.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.facebook),
        10.x,
        SvgPicture.asset(Assets.twwiter),
        10.x,
        SvgPicture.asset(Assets.insa),


      ],
    );
  }
}

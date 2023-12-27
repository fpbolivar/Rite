import 'package:flutter/material.dart';
import 'package:rite_funeral_flutter/Applications/Services/Navigation/navigation.dart';
import 'package:rite_funeral_flutter/Data/Resources/colors.dart';
import 'package:rite_funeral_flutter/Data/Resources/text_style.dart';

import '../Onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigate.to(context, const OnboardingScreen());
      },
    );

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 210,
              width: 210,
            ),
            Text(
              "RITE",
              style: Styles.bold(color: Colors.white, fontSize: 95),
            ),
            // Text(
            //   "RITE",
            //   style: Styles.bold(color: Colors.white, fontSize: 50),
            // ),
          ],
        ),
      ),
    );
  }
}

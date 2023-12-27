import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rite_funeral_flutter/Data/Resources/colors.dart';
import 'package:rite_funeral_flutter/Presentations/Common/Splash/splash_screen.dart';
import 'package:rite_funeral_flutter/Presentations/Widgets/Vendor/Auth/Login/login_screen.dart';
import 'Data/Resources/text_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                useMaterial3: true,
                iconTheme: const IconThemeData(
                  size: 26,
                  color: Colors.black87,
                ),
                // buttonTheme: const ButtonThemeData(
                //     textTheme: ButtonTextTheme.primary,
                //     colorScheme: ColorScheme.light(
                //       primary: AppColors.primary,
                //       onPrimary: AppColors.primary,
                //     )),
                scaffoldBackgroundColor: Colors.white,
                datePickerTheme: DatePickerThemeData(
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  todayBorder: const BorderSide(color: AppColors.primary),

                  cancelButtonStyle: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(AppColors.primary),
                      overlayColor: MaterialStateProperty.all(
                          AppColors.primary.withOpacity(0.1)),
                      textStyle: MaterialStateProperty.all(Styles.medium(
                          fontSize: 13, color: AppColors.primary))),
                  confirmButtonStyle: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(AppColors.primary),
                      overlayColor: MaterialStateProperty.all(
                          AppColors.primary.withOpacity(0.1)),
                      textStyle: MaterialStateProperty.all(Styles.medium(
                          fontSize: 13, color: AppColors.primary))),
                  rangeSelectionOverlayColor:
                      MaterialStateProperty.all(AppColors.primary),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25).r),
                  headerBackgroundColor: AppColors.primary,
                  dividerColor: AppColors.primary,

                  dayBackgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.lightGreenAccent;
                    } else if (states.contains(MaterialState.focused)) {
                      return AppColors.primary;
                    }
                    return null;
                  }),

                  headerHelpStyle: Styles.regular(fontSize: 14),
                  weekdayStyle: Styles.medium(fontSize: 14),
                  dayStyle: Styles.regular(fontSize: 12),
                  yearStyle: Styles.regular(fontSize: 14),
                  // headerHeadlineStyle: AppStyles.QuicksandBold(size: 20),

                  rangeSelectionBackgroundColor: AppColors.primary,
                  inputDecorationTheme: InputDecorationTheme(
                    border: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffdedede), width: 1)),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffdedede), width: 1)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffdedede), width: 1),
                        borderRadius: BorderRadius.zero),
                    disabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffdedede), width: 1),
                        borderRadius: BorderRadius.zero),
                    labelStyle:
                        Styles.medium(fontSize: 15, color: AppColors.primary),
                    hintStyle: Styles.regular(fontSize: 14),
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Color(0xffFFFFFF),
                    elevation: 0,
                    selectedIconTheme: IconThemeData(size: 20),
                    unselectedIconTheme: IconThemeData(size: 20)),
                primaryColor: AppColors.primary),
            home: const SplashScreen(),
          );
        });
  }
}

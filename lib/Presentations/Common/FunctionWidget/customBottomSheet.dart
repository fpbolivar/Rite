import 'package:rite_funeral_flutter/imports.dart';

class CustomBottomSheet {
  showBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor: AppColors.whiteColor,
        context: context,
        builder: (BuildContext context) {
          return child;
        });
  }
}

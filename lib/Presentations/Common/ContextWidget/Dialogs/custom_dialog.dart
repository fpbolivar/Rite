import 'package:rite_funeral_flutter/Presentations/Common/ContextWidget/Dialogs/log_out_dialog.dart';
import 'package:rite_funeral_flutter/Presentations/Common/ContextWidget/Dialogs/sucess_dialog.dart';
import 'package:rite_funeral_flutter/imports.dart';

class CustomDialog{





  static Future<void> successDialog(BuildContext context, {required String? title,required String? message,bool? barrierDismissible}) async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black12,
      barrierDismissible: barrierDismissible??true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(15).r,
          elevation: 0.0,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: SuccessFulDialog.show(context: context, title: title, message: message),
        );

      },
    );
  }


  static Future<void> logout(BuildContext context, {required String? title,required String? message,bool? barrierDismissible}) async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black12,
      barrierDismissible: barrierDismissible??true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(15).r,
          elevation: 0.0,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: LogOutDailog.show(context: context, title: title, message: message),
        );

      },
    );
  }


}

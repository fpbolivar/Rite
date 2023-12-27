import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rite_funeral_flutter/Data/Resources/colors.dart';

class BackArrowWidget extends StatelessWidget {
  const BackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
          onTap: () {
            Navigator.of(context).pop(true);
          },
          child: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
            color: AppColors.medium,
          )),
    );
  }
}

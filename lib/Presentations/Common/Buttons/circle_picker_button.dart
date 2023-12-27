import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rite_funeral_flutter/Applications/Services/PickerServices/picker_services.dart';
import 'package:rite_funeral_flutter/Data/Resources/colors.dart';

class CirclePickerButton extends StatefulWidget {
  const CirclePickerButton({this.icon, this.callBack, super.key});
  final IconData? icon;
  final void Function(File? image)? callBack;
  @override
  State<CirclePickerButton> createState() => _CirclePickerButtonState();
}

class _CirclePickerButtonState extends State<CirclePickerButton> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 45,
      onTap: () async {
        await PickFile.pickSingleImage().then((value) => image = File(value));
        setState(() {});

        if (widget.callBack != null) widget.callBack!(image);
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: AppColors.divider.withOpacity(0.2)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: image == null
              ? Icon(
                  widget.icon ?? Icons.add,
                  size: 25,
                  color: AppColors.divider.withOpacity(0.5),
                )
              : Image.file(
                  image!,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}

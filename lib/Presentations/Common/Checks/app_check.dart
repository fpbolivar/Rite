import 'package:rite_funeral_flutter/imports.dart';

class AppCheck extends StatelessWidget {
  const AppCheck({required this.value, this.onChanged, super.key});
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: AppColors.primary,
      checkColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      side: const BorderSide(color: AppColors.divider),
      value: value,
      onChanged: onChanged,
    );
  }
}

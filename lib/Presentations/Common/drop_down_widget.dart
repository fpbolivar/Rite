import 'package:rite_funeral_flutter/Data/AppData/data.dart';
import 'package:rite_funeral_flutter/imports.dart';

class GeneralizedDropDown extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String> onChanged;
  final double width;
  final double height;
  final bool? isBorder;
  final EdgeInsets? padding;
  final bool? isFit;
  final TextStyle? style;
  final Widget? icon;
  final String? hint;

  const GeneralizedDropDown(
      {Key? key,
        required this.items,
        required this.selectedValue,
        required this.onChanged,
        this.width = 80,
        this.height = 80,
        this.padding,
        this.isBorder,
        this.isFit,
        this.style,
        this.icon,
        this.hint})
      : super(key: key);

  @override
  State<GeneralizedDropDown> createState() => _GeneralizedDropDownState();
}

class _GeneralizedDropDownState extends State<GeneralizedDropDown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.whiteColor,
      value: _selectedValue,
      isExpanded: true,
      hint: AppText(
        widget.hint ?? "",
        style: Styles.regular( fontSize: 14.sp,fontWeight: FontWeight.w400,color: AppColors.greyTextColor),
      ),
      elevation: 0,

      icon: widget.icon,

      // icon: ,
      autofocus: false,
      padding: widget.padding,
      onChanged: (value) {
        setState(() {
          _selectedValue = value!;
          widget.onChanged(value);
        });
      },
      decoration: const InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent)
        )
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child:  AppText(item,
              style: widget.style ??
                  Styles.regular( fontSize: 16.sp,fontWeight: FontWeight.w500)),
        );
      }).toList(),
    );
  }
}

class CustomDropDownWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final String hintText;
  dynamic value;
  final double vMargin;
  final double hMargin;
  final double? dropDownHeight;
  final String validationText;
  final ValueChanged onChanged;
  final List<DropdownMenuItem<Object>> itemsMap;
  final bool isBorderRequired;
  final bool isShadowRequired;
  final TextStyle? hintStyle;
  final Color? filledColor;

  CustomDropDownWidget({
    super.key,
    this.hMargin = 0,
    this.vMargin = 0,
    this.dropDownHeight,
    this.hintStyle,
    required this.prefixIcon,
    required this.hintText,
    required this.value,
    required this.validationText,
    required this.onChanged,
    required this.itemsMap,
    this.isBorderRequired = true,
    this.isShadowRequired = false, this.filledColor,
  });

  final double borderRadius = 12;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: vMargin, horizontal: hMargin).r,
      child: DropdownButtonFormField(
        isExpanded: true,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        menuMaxHeight: dropDownHeight,
        validator: (value) {
          if (value == null) {
            return validationText;
          } else {
            return null;
          }
        },

        decoration: InputDecoration(
          fillColor: filledColor?? Colors.transparent,
          filled: true,
          prefixIcon: prefixIcon != null
              ? SizedBox(
            width: 15.w,
            height: 15.w,
            child: Center(
              child: prefixIcon,
            ),
          )
              : null,


          contentPadding:
          const EdgeInsets.symmetric(
            vertical: 13,
            horizontal: 13,
          ).r,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12.r,
            ),
            borderSide: BorderSide(
              width: 0.40,
              color: isBorderRequired ? Colors.red : Colors.transparent,
            ),
          ),
          errorBorder: isBorderRequired
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12.r,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 0.40,
            ),
          )
              : outlineInputBorder(),
          border: isBorderRequired
              ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? 12.r,
              ),
              borderSide: const BorderSide(width:1,color: AppColors.greyTextColor)
          )
              : outlineInputBorder(),
          focusedBorder: isBorderRequired
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12.r,
            ),
            borderSide: const BorderSide(
              width: 0.40,
              color: AppColors.primary,
            ),
          )
              : outlineInputBorder(),
          enabledBorder:isBorderRequired
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 12.r,
            ),
            borderSide: const BorderSide(
              width: 0.40,
              color: AppColors.greyTextColor,
            ),
          )
              : outlineInputBorder(),
        ),
        hint: Text(
          hintText,
          style: hintStyle?? Styles.medium(
            color: AppColors.textFieldHint,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        dropdownColor:filledColor?? Colors.white,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color:AppColors.textFieldHint,
        ),
        iconSize: 28.r,
        style: hintStyle?? Styles.medium(
          color: FocusScope.of(context).hasFocus
              ? AppColors.medium
              : AppColors.medium,
          fontSize:  16.sp,
          fontWeight: FontWeight.w400,
        ),
        value: value,
        onChanged: onChanged,
        items: itemsMap,
      ),
    );
  }

  outlineInputBorder() {
    return const UnderlineInputBorder(
      borderSide:  BorderSide(color: AppColors.borderColor),
    );
  }
}

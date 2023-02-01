import 'package:amuzesh_system/core/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {Key? key, this.onChecked, required this.checkboxValue, this.scaleSize})
      : super(key: key);

  final Function(bool?)? onChecked;
  final bool checkboxValue;
  final double? scaleSize;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleSize ?? 1,
      child: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: BorderSide(color: Constants.primaryColor, width: 1),
        checkColor: Colors.blueAccent,
        value: checkboxValue,
        onChanged: onChecked,
      ),
    );
  }
}

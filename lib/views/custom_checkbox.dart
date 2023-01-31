import 'package:amuzesh_system/core/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: BorderSide(color: Constants.primaryColor, width: 1),
        checkColor: Colors.blueAccent,
        value: checkboxValue,
        onChanged: (value) {
          setState(() {
            checkboxValue = value!;
          });
        }
     );
  }
}

import 'dart:ffi';

import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/views/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog(
      {Key? key,
      this.onPressedSave,
      this.onPressedEdit,
      this.className,
      this.classTeacher,
      required this.isAddAction,
      this.classUnit})
      : super(key: key);

  final Function()? onPressedSave;
  final Function()? onPressedEdit;
  String? className;
  String? classTeacher;
  int? classUnit;
  final bool isAddAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            initialValue: className,
            onChanged: (value) {
              className = value;
            },
            hintText: 'enter class name',
          ),
          Constants.littleSizeBox,
          CustomTextField(
            initialValue: classTeacher,
            onChanged: (value) {
              classTeacher = value;
            },
            hintText: 'enter teacher name',
          ),
          Constants.littleSizeBox,
          CustomTextField(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            initialValue: classUnit != null ? classUnit.toString() : '',
            onChanged: (value) {
              classUnit = int.parse(value!);
            },
            hintText: 'enter unit number',
          ),
          Constants.littleSizeBox,
          ElevatedButton(
              onPressed: () => goPage(context),
              child: Text(isAddAction ? 'save' : 'update')),
        ],
      ),
    );
  }

  void goPage(BuildContext context) {
    Navigator.pop(context, {
      'className': className,
      'teacherName': classTeacher,
      'classUnit': classUnit
    });
  }
}

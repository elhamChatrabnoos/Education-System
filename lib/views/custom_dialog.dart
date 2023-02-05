import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/views/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_texts.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              checkValidation: _classNameValid,
              initialValue: className,
              onChanged: (value) => className = value,
              hintText: AppTexts.classNameError,
            ),
            Constants.littleSizeBox,
            CustomTextField(
              checkValidation: _teacherNameValid,
              initialValue: classTeacher,
              onChanged: (value) => classTeacher = value,
              hintText: AppTexts.teacherNameHint,
            ),
            Constants.littleSizeBox,
            CustomTextField(
              checkValidation: _unitNumberValid,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              initialValue: classUnit != null ? classUnit.toString() : '',
              onChanged: (value) => classUnit = int.parse(value!),
              hintText: AppTexts.unitNumberHint,
            ),
            Constants.littleSizeBox,
            ElevatedButton(
                onPressed: () => _goBackMainPage(context),
                child: Text(isAddAction
                    ? AppTexts.saveButtonTxt
                    : AppTexts.updateButtonTxt)),
          ],
        ),
      ),
    );
  }

  String? _unitNumberValid(value) {
    if (value!.isEmpty || int.parse(value) < 1 || int.parse(value) > 5) {
      return AppTexts.unitNumberError;
    }
  }

  String? _teacherNameValid(value) {
    if (value!.length < 5) {
      return AppTexts.classNameError;
    }
  }

  String? _classNameValid(value) {
    if (value!.length < 5) {
      return AppTexts.classNameError;
    }
  }

  void _goBackMainPage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, {
        'className': className,
        'teacherName': classTeacher,
        'classUnit': classUnit
      });
    }
  }
}

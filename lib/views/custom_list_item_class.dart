import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/views/custom_checkbox.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:flutter/material.dart';

class CustomListItemClass extends StatelessWidget {
  const CustomListItemClass(
      {Key? key,
      required this.textName,
      required this.teacherName,
      this.onDeleteTap,
      required this.unitNumber,
      this.onEditTap,
      this.isEditableActive = true,
        this.onCheckbox,
        required this.checkboxValue})
      : super(key: key);

  final String textName;
  final String teacherName;
  final int unitNumber;
  final Function()? onDeleteTap;
  final Function()? onEditTap;
  final bool? isEditableActive;
  final Function(bool?)? onCheckbox;
  final bool checkboxValue;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        color: const Color.fromARGB(255, 255, 255, 255),
        child:
            Padding(padding: const EdgeInsets.all(15), child: _wholeContent()));
  }

  Row _wholeContent() {
    return Row(
      children: [
        _firstColumn(),
        const Spacer(),
        _editingColumn(),
      ],
    );
  }

  Widget _editingColumn() {
    return Column(
      children: [
        CustomCheckbox(
          scaleSize: 1.5,
          checkboxValue: checkboxValue,
          onChecked: onCheckbox,
        ),
        Constants.littleSizeBox,
        Row(
          children: [
            InkWell(
              onTap: onDeleteTap,
              child: isEditableActive!
                  ? const Icon(Icons.delete, size: 30)
                  : const SizedBox(),
            ),
            Constants.littleSizeBox,
            InkWell(
              onTap: onEditTap,
              child: isEditableActive!
                  ? const Icon(Icons.edit, size: 30)
                  : const SizedBox(),
            )
          ],
        )
      ],
    );
  }

  Column _firstColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Constants.littleSizeBox,
        CustomText(text: textName, textSize: 25),
        Constants.littleSizeBox,
        _teacherNAme(),
        Constants.littleSizeBox,
        _unitNumberTxt(),
      ],
    );
  }

  Widget _unitNumberTxt() {
    return Row(
      children: [
        const CustomText(
          text: 'unit number: ',
          textSize: 15,
          fontWeight: FontWeight.normal,
        ),
        CustomText(
          text: unitNumber.toString(),
          textSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }

  Row _teacherNAme() {
    return Row(
      children: [
        const CustomText(
            text: 'teacher name: ',
            textSize: 15,
            fontWeight: FontWeight.normal),
        CustomText(
          text: teacherName,
          textSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}

import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/views/custom_checkbox.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:flutter/material.dart';

class CustomListItemClass extends StatelessWidget {
  const CustomListItemClass(
      {Key? key,
      required this.textName,
      required this.teacherName,
      this.closeOnTap,
      required this.unitNumber, this.editOnTap})
      : super(key: key);

  final String textName;
  final String teacherName;
  final int unitNumber;
  final Function()? closeOnTap;
  final Function()? editOnTap;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        color: const Color.fromARGB(255, 255, 255, 255),
        child:
            Padding(padding: const EdgeInsets.all(15), child: wholeContent()));
  }

  Row wholeContent() {
    return Row(
      children: [
        firstColumn(),
        const Spacer(),
        edittingColumn()
      ],
    );
  }

  Column edittingColumn() {
    return Column(
        children: [
          const CustomCheckbox(),
          InkWell(
            onTap: closeOnTap,
            child: const Icon(Icons.delete, size: 30),
          ),
          Constants.littleSizeBox,
          InkWell(
            onTap: editOnTap,
            child: const Icon(Icons.edit, size: 30),
          )
        ],
      );
  }

  Column firstColumn() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.littleSizeBox,
          CustomText(text: textName, textSize: 25),
          Constants.littleSizeBox,
          teacherNAme(),
          Constants.littleSizeBox,
          unitNumberTxt(),
        ],
      );
  }

  Row unitNumberTxt() {
    return Row(
          children: [
            const CustomText(
                text: 'unit number: ',
                textSize: 15,
                fontWeight: FontWeight.normal),
            CustomText(
              text: unitNumber.toString(),
              textSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ],
        );
  }

  Row teacherNAme() {
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

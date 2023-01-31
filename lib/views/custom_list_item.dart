import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem(
      {Key? key, required this.textName, required this.classNumber})
      : super(key: key);

  final String textName;
  final String classNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.close, color: Colors.red),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/book.jpg',
                        width: 50, height: 50),
                    Constants.littleSizeBox,
                    CustomText(text: textName, textSize: 25),
                  ],
                ),
              ),
              Constants.littleSizeBox,
              Row(
                children: [
                  const CustomText(
                      text: 'clsass number: ',
                      textSize: 15,
                      fontWeight: FontWeight.normal),
                  CustomText(
                    text: classNumber,
                    textSize: 15,
                    fontWeight: FontWeight.normal,
                  )
                ],
              ),
              // Row(
              //   children: [
              //     CustomText(text: 'classes number', textSize: 15,),
              //     CustomText(text:classNumber, textSize: 15)
              //   ],
              // )
            ],
          ),
        ));
  }
}

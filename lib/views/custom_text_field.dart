import 'package:amuzesh_system/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.onChanged,
      this.icon,
      this.correctFormat,
      this.secure,
      this.onTapIcon,
      this.hintText,
      this.initialValue,
      this.inputFormatters,
      this.errorMsg,
      this.checkValidation})
      : super(key: key);

  final Function(String?)? onChanged;
  final Function()? onTapIcon;
  final bool? secure;
  final Icon? icon;
  final bool? correctFormat;
  final String? hintText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorMsg;
  final String? Function(String?)? checkValidation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: checkValidation,
      decoration: InputDecoration(
        errorText: errorMsg,
        hintText: hintText ?? '',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Constants.textFieldColor),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        border: InputBorder.none,
        filled: true,
        fillColor: Constants.textFieldColor,
        suffixIcon: InkWell(onTap: onTapIcon, child: icon ?? const SizedBox()),
      ),
      obscureText: secure ?? false,
    );
  }
}

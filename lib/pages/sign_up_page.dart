import 'package:amuzesh_system/core/app_texts.dart';
import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../providers/login_sign_up_provider.dart';
import '../views/custom_button.dart';
import '../views/custom_checkbox.dart';
import '../views/custom_text_field.dart';
import 'login_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String? _passwordText;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginSignUpProvider(),
      child: Consumer<LoginSignUpProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              body: _bodyOfPage(context, provider));
        },
      ),
    );
  }

  Padding _bodyOfPage(BuildContext context, LoginSignUpProvider provider) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Constants.normalSizeBox,
              CustomText(text: AppTexts.createAccountBtn, textSize: 30),
              Constants.normalSizeBox,
              CustomText(text: AppTexts.emailTxt),
              Constants.littleSizeBox,
              _emailTextField(provider),
              Constants.normalSizeBox2,
              CustomText(text: AppTexts.passwordTxt),
              Constants.littleSizeBox,
              _passwordTextField(provider),
              Constants.normalSizeBox2,
              CustomText(text: AppTexts.confPassTxt),
              Constants.littleSizeBox,
              _confPassTextField(provider),
              Constants.littleSizeBox,
              _agreeToTerms(),
              Constants.normalSizeBox2,
              _createAccountButton(provider, context),
              Constants.littleSizeBox,
              _signUpWithGoogle(),
            ],
          ),
        ));
  }

  Row _agreeToTerms() {
    bool? checked = false;
    return Row(
      children: [
        CustomCheckbox(
          checkboxValue: checked,
          onChecked: (value) => checked = value!,
        ),
        Text(AppTexts.agreeCheckBox),
      ],
    );
  }

  CustomButton _createAccountButton(
      LoginSignUpProvider provider, BuildContext context) {
    return CustomButton(
      textColor: Colors.white,
      buttonText: AppTexts.createAccountBtn,
      buttonColor: Colors.blue,
      onTap: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        }
      },
    );
  }

  CustomButton _signUpWithGoogle() {
    return CustomButton(
        textColor: Colors.blue,
        buttonText: AppTexts.signUpGoogleBtn,
        buttonColor: Colors.white);
  }

  Widget _confPassTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      checkValidation: (value) {
        if (!provider.checkConfirmPass(value!, _passwordText!)) {
          return AppTexts.confPassError;
        }
      },
      icon: const Icon(Icons.remove_red_eye),
      onTapIcon: () => provider.showHideConfPass(),
      secure: provider.secureTextConfPass,
    );
  }

  Widget _passwordTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      checkValidation: (value) {
        if (!provider.checkPasswordFormat(value!)) {
          return AppTexts.passwordError;
        }
      },
      onChanged: (p0) => _passwordText = p0,
      icon: const Icon(Icons.remove_red_eye),
      onTapIcon: () => provider.showHidePass(),
      secure: provider.secureTextPass,
    );
  }

  Widget _emailTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      checkValidation: (value) {
        if (!provider.checkEmailValidation(value!)) {
          return AppTexts.emailError;
        }
      },
      secure: false,
      onChanged: (value) => provider.checkEmailValidation(value!),
      icon: provider.correctEmail
          ? const Icon(Icons.check)
          : const Icon(Icons.email_outlined),
    );
  }
}

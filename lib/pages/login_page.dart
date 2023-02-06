import 'package:amuzesh_system/core/app_texts.dart';
import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/pages/home_page.dart';
import 'package:amuzesh_system/views/custom_text.dart';
import 'package:amuzesh_system/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/login_sign_up_provider.dart';
import '../views/custom_button.dart';
import '../views/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  String _password = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginSignUpProvider(),
      child: Consumer<LoginSignUpProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              body: loginBody(context, provider));
        },
      ),
    );
  }

  Padding loginBody(BuildContext context, LoginSignUpProvider provider) {
    return Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: provider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleTextImage(),
              Constants.normalSizeBox,
              CustomText(text: AppTexts.emailTxt),
              Constants.littleSizeBox,
              emailTextField(provider),
              Constants.normalSizeBox2,
              CustomText(text: AppTexts.passwordTxt),
              Constants.littleSizeBox,
              passwordTextField(provider),
              Constants.normalSizeBox,
              buttons(context, provider),
            ],
          ),
        ));
  }

  Row buttons(BuildContext context, LoginSignUpProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          buttonWidth: 150,
          textColor: Constants.loginTextColor,
          buttonText: AppTexts.loginBtnTxt,
          buttonColor: Constants.loginBtnColor,
          onTap: () {
            if (provider.checkFieldValidation()) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
        ),
        CustomButton(
          buttonWidth: 150,
          textColor: Constants.loginBtnColor,
          buttonText: AppTexts.signUpBtnTxt,
          buttonColor: Constants.loginTextColor,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
        )
      ],
    );
  }

  Widget passwordTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      checkValidation: (value) {
        if (value!.isEmpty) {
          return AppTexts.incorrectPassMsg;
        }
      },
      icon: const Icon(Icons.remove_red_eye),
      onTapIcon: () {
        provider.showHidePass();
      },
      onChanged: (p0) => _password = p0!,
      secure: provider.secureTextPass,
    );
  }

  Widget emailTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      checkValidation: (value) {
        if (!provider.checkEmailValidation(value!) || value.isEmpty) {
          return AppTexts.unavailableEmailMsg;
        }
      },
      secure: false,
      icon: const Icon(Icons.email_outlined),
    );
  }

  Center titleTextImage() {
    return Center(
        child: Column(
      children: [
        Constants.littleSizeBox,
        CustomText(text: AppTexts.loginTitle, textSize: 35),
        Image.asset('assets/images/student.png', alignment: Alignment.center),
      ],
    ));
  }
}

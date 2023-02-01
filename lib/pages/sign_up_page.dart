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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginSignUpProvider(),
      child: Consumer<LoginSignUpProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: bodyOfPage(context, provider)
          );
        },
      ),
    );
  }

  Padding bodyOfPage(BuildContext context, LoginSignUpProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.normalSizeBox,
          const CustomText(text: 'Create Account', textSize: 30),
          Constants.normalSizeBox,
          const CustomText(text: 'Email'),
          Constants.littleSizeBox,
          emailTextField(provider),
          Constants.normalSizeBox2,
          const CustomText(text: 'Password'),
          Constants.littleSizeBox,
          passwordTextField(provider),
          Constants.normalSizeBox2,
          const CustomText(text: 'Confirm password'),
          Constants.littleSizeBox,
          confPassTextField(provider),
          Constants.littleSizeBox,
          agreeToTerms(),
          Constants.normalSizeBox2,
          createAcountButton(provider, context),
          Constants.littleSizeBox,
          signUpWithGoogle(),
        ],
      ),
    );
  }

  Row agreeToTerms() {
    bool? checked = false;
    return Row(
      children: [
        CustomCheckbox(
          checkboxValue: checked,
          onChecked: (value) {
            checked = value!;
          },
        ),
        const Text('I agree to the Terms & Condition'),
      ],
    );
  }

  CustomButton createAcountButton(
      LoginSignUpProvider provider, BuildContext context) {
    return CustomButton(
      textColor: Colors.white,
      buttonText: 'Create account',
      buttonColor: Colors.blue,
      onTap: () {
        if (provider.correctEmail) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        } else {}
      },
    );
  }

  CustomButton signUpWithGoogle() {
    return CustomButton(
        textColor: Colors.blue,
        buttonText: 'Sign up with Google',
        buttonColor: Colors.white);
  }

  Widget confPassTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      icon: const Icon(Icons.remove_red_eye),
      onTapIcon: () => provider.showHideConfPass(),
      secure: provider.secureTextConfPass,
    );
  }

  Widget passwordTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      icon: const Icon(Icons.remove_red_eye),
      onTapIcon: () {
        provider.showHidePass();
      },
      secure: provider.secureTextPass,
    );
  }

  Widget emailTextField(LoginSignUpProvider provider) {
    return CustomTextField(
      secure: false,
      onChanged: (value) => provider.checkEmailValidation(value!),
      icon: provider.correctEmail ? const Icon(Icons.check) : null,
    );
  }
}

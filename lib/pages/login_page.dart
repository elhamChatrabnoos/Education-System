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
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginSignUpProvider(),
      child: Consumer<LoginSignUpProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: loginBody(context, provider));
        },
      ),
    );
  }

  Padding loginBody(BuildContext context, LoginSignUpProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleTextImage(),
          Constants.normalSizeBox,
          const CustomText(text: 'Email'),
          Constants.littleSizeBox,
          emailTextField(provider),
          Constants.normalSizeBox2,
          const CustomText(text: 'Password'),
          Constants.littleSizeBox,
          passwordTextField(provider),
          Constants.normalSizeBox,
          buttons(context, provider),
        ],
      ),
    );
  }

  Row buttons(BuildContext context, LoginSignUpProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            buttonWidth: 150,
            textColor: Colors.white,
            buttonText: 'Login',
            buttonColor: Colors.blue),
        CustomButton(
            buttonWidth: 150,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            textColor: Colors.blue,
            buttonText: 'Sign up',
            buttonColor: Colors.white)
      ],
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

  Center titleTextImage() {
    return Center(
        child: Column(
          children: [
            Constants.littleSizeBox,
            CustomText(text: 'Login Account', textSize: 35),
            Image.asset(
                'assets/images/student.png', alignment: Alignment.center),
          ],
        ));
  }


}

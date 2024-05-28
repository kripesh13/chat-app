import 'package:chat_app/constant/constant.dart';
import 'package:chat_app/constant/k_button.dart';
import 'package:chat_app/constant/k_text_form_field.dart';
import 'package:chat_app/view/services/auth/auth.dart';
import 'package:chat_app/view/services/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void login() async {
    final _authServices = AuthServices();
    try {
      await _authServices.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loging'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            customTextField(
              hintText: 'email',
              controller: _emailController,
            ),
            kSizedBox(),
            customTextField(
              hintText: 'password',
              controller: _passwordController,
            ),
            LSizedBox(),
            InkWell(
                child: Container(
                    width: 250,
                    padding: kPadding(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: Center(
                      child: Text("don't have a account",
                          style: kkWhiteTextStyle()),
                    )),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ));
                }),
            kSizedBox(),
            InkWell(
                child: Container(
                  width: 250,
                  padding: kPadding(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      'login',
                      style: kkWhiteTextStyle(),
                    ),
                  ),
                ),
                onTap: () {
                  login();
                })
          ],
        ),
      ),
    );
  }
}

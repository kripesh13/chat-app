import 'package:chat_app/utils/custom_text_form_field.dart';
import 'package:chat_app/view/Home/home_screen.dart';
import 'package:chat_app/view/services/auth/auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthServices _authService = AuthServices();

  void _signUp() async {
    try {
      await _authService.signUpWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            customTextField(
              controller: _emailController,
              hintText: 'email'
            ),
            customTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscure: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

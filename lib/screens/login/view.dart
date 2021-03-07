import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/bottom_navigation/view.dart';
import 'package:graduation_project/screens/forget_password/view.dart';
import 'package:graduation_project/screens/login/controller.dart';
import 'package:graduation_project/screens/login/model.dart';
import 'package:graduation_project/screens/signup/view.dart';
import 'package:graduation_project/ui_widgets/custom_button.dart';
import 'package:graduation_project/ui_widgets/text_field.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // String _email;
  // String _password;
  // bool _loading = false;
  // LoginController _loginController = LoginController();
  // LoginModel _loginModel = LoginModel();
  //
  // void _submitForm() async {
  //   if (!_formKey.currentState.validate()) {
  //     return;
  //   }
  //   _formKey.currentState.save();
  //   setState(() {
  //     _loading = true;
  //   });
  //   print(_email);
  //   print(_password);
  //   _loginModel = await _loginController.userLogin(
  //       email: _email, password: _password, base: "signIn");
  //   if (_loginModel.idToken != null) {
  //     Navigator.push(context,
  //         MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
  //   } else {
  //     Toast.show("Email or password isn't correct", context,
  //         duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
  //   }
  //   setState(() {
  //     _loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'EcoCulture',
          style: TextStyle(color: Colors.greenAccent, fontSize: 22),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    hint: 'Email address',
                    secure: false,
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'Email required';
                      }
                    },
                    onSave: (value) {

                    },
                  ),
                  CustomTextField(
                    hint: 'Password',
                    secure: true,
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'Password required';
                      }
                    },
                    onSave: (value) {

                    },
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordView()));
                    },
                    child: Text('Forget password ?'))
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
                  title: 'Login',
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavigationScreen()));
                  },
                  color: Colors.amber,
                ),
          CustomButton(
            title: 'Create Account',
            color: Colors.grey,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          ),
        ],
      ),
    );
  }
}

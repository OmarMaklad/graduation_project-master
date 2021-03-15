import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/view.dart';
import 'package:graduation_project/CustomService/home/view.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/router.dart';
import 'package:graduation_project/core/validation.dart';
import 'package:graduation_project/saler/home/view.dart';
import 'package:graduation_project/screens/bottom_navigation/view.dart';
import 'package:graduation_project/screens/forget_password/view.dart';
import 'package:graduation_project/screens/home/view.dart';
import 'package:graduation_project/screens/login/controller.dart';
import 'package:graduation_project/screens/login/model.dart';
import 'package:graduation_project/screens/signup/view.dart';
import 'package:graduation_project/ui_widgets/custom_button.dart';
import 'package:graduation_project/ui_widgets/text_field.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:graduation_project/widgets/toast.dart';
import 'package:graduation_project/widgets/widget/GridButton.dart';
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
  String email,password;
  bool _isLoading = false;

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
                    valid: Validations.email,
                    onsave: (value) => email = value,
                  ),
                  CustomTextField(
                    hint: 'Password',
                    valid: Validations.password,
                    onsave: (value)=> password = value,
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
            height: 20,
          ),
          _isLoading ? LoadingIndicator() : CustomButton(
            title: 'Login',
            color: Colors.greenAccent,
            onPressed: () async{
              _formKey.currentState.save();
              if(!_formKey.currentState.validate()) return;
              setState(()=> _isLoading = true);
              final message = await LoginController().login(email, password);
              if(message == 'ok') {
                MagicRouter.navigateAndPopAll(getHomeByType());
              } else
                showToast(message);
              setState(()=> _isLoading = false);
            },
          ),
          CustomButton(
            title: 'Create Account',
            color: Colors.grey,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
          ),
        ],
      ),
    );
  }
}

/*
CustomButton(
                  title: 'Admin',
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => TabsScreen()));
                  },
                  color: Colors.amber,
                ),
          CustomButton(
                  title: 'Saler',
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => SalerTabsScreen()));
                  },
                  color: Colors.amber,
                ),
          CustomButton(
                  title: 'Custom Service',
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => CustomServiceHome()));
                  },
                  color: Colors.amber,
                ),
 */
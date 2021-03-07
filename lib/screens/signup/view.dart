import 'package:flutter/material.dart';
import 'package:graduation_project/screens/bottom_navigation/view.dart';
import 'package:graduation_project/ui_widgets/custom_button.dart';
import 'package:graduation_project/ui_widgets/text_field.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'SignUp',
          style: TextStyle(color: Colors.greenAccent, fontSize: 22),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            hint: 'First name',

          ),
          CustomTextField(
            hint: 'Last name',

          ),
          CustomTextField(
            hint: 'Email address',

          ),
          CustomTextField(
            hint: 'Password',

          ),
          CustomTextField(
            hint: 'Confirm password',

          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text('Country'),
                Expanded(child: SizedBox()),
                Text('Select'),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButton(
            title: 'Create your account',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BottomNavigationScreen()));
            },
            color: Colors.amber,
          ),
        ],
      ),
    );
    
  }
}

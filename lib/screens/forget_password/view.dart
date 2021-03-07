import 'package:flutter/material.dart';
import 'package:graduation_project/screens/forget_password/controller.dart';
import 'package:graduation_project/ui_widgets/custom_button.dart';
import 'package:graduation_project/ui_widgets/text_field.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';

class ForgetPasswordView extends StatefulWidget {
  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  ForgetPasswordController _passwordController = ForgetPasswordController();
  String _email;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(160, 0, 19, 1),
      body: Form(
        key: _globalKey,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .93,
          decoration: BoxDecoration(
              color: Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70))),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                color: Theme.of(context).accentColor,
                height: MediaQuery.of(context).size.height * .4,
              ),
              CustomTextField(
                hint: 'البريد الالكتروني',
                onsave: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                valid: (value) {
                  if (value.toString().isEmpty) {
                    return 'ادخل البريد الالكتروني';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 28,
              ),
              _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Builder(
                      builder: (ctx) => CustomButton(
                          title: "إرسال الرمز",
                          onPressed: () async {
                            String message;
                            if (_globalKey.currentState.validate()) {
                              _globalKey.currentState.save();
                              message = await _passwordController
                                  .resetPassword(_email);
                              if (!message.contains('Failed'))
                                //Scaffold.of(ctx).hideCurrentSnackBar();
                                Scaffold.of(ctx).showSnackBar(SnackBar(
                                  content: Text(message),
                                  backgroundColor: Colors.black,
                                ));
                              else
                                Navigator.pop(context);
                            }
                          }),
                    ),
              SizedBox(
                height: 28,
              ),
              // NewUserButton(),
            ],
          ),
        ),
      ),
    );
  }
}

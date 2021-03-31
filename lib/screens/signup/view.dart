import 'package:flutter/material.dart';
import 'package:graduation_project/core/router.dart';
import 'package:graduation_project/core/validation.dart';
import 'package:graduation_project/screens/home/view.dart';
import 'package:graduation_project/screens/signup/controller.dart';
import 'package:graduation_project/ui_widgets/custom_button.dart';
import 'package:graduation_project/ui_widgets/text_field.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:graduation_project/widgets/toast.dart';

import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

enum typesEnum {Sealer,Buyer}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _isLoading = false;
  String firstName,lastName,email,password;
  typesEnum type = typesEnum.Sealer;
  final key = GlobalKey<FormState>();
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
      body: Form(
        key: key,
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: [
            CustomTextField(
              hint: 'First name',
              valid: Validations.name,
              onsave: (v)=> firstName = v,
            ),
            CustomTextField(
              hint: 'Last name',
              valid: Validations.name,
              onsave: (v)=> lastName = v,
            ),
            CustomTextField(
              hint: 'Email address',
              valid: Validations.email,
              onsave: (v)=> email = v,
            ),
            CustomTextField(
              hint: 'Password',
              valid:(v){
                bool passValid = RegExp("^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*").hasMatch(v);
                if (v.isEmpty ||!passValid)
                {
                  return 'Password should contain Minimum 1 Upper case Minimum 1 lowercase Minimum 1 Numeric Number Minimum 1 Special Character Common Allow Character ( ! @ # \$ & * ~ )';
                }
              },
              icon: Icons.lock_outline,
              onsave: (v)=> password = v,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,10,0,0),
              child: Text('Choose user type: ',style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold),),
            ),
            RadioListTile(
              selected: type == typesEnum.Sealer,
                title: Text('Seller'),
                toggleable: true,
                value: typesEnum.Sealer, groupValue: type, onChanged: (v){
              setState(()=> type = v);
            }),
            RadioListTile(
                selected: type == typesEnum.Buyer,
                toggleable: true,
                title: Text('Buyer'),
                value: typesEnum.Buyer, groupValue: type, onChanged: (v){
              setState(()=> type = v);
            }),
            SizedBox(
              height: 20,
            ),
            _isLoading ? LoadingIndicator() : CustomButton(
              title: 'Create your account',
              onPressed: () async{
                key.currentState.save();
                if(!key.currentState.validate()) return;
                setState(()=> _isLoading = true);
                final message = await SignUpController().signUp(
                  lastName: lastName,
                  firstName: firstName,
                  email: email,
                  password: password,
                  type: type == typesEnum.Sealer ? 'sealer' : 'buyer'
                );
                if(message == 'ok')
                  MagicRouter.navigateAndPopAll(getHomeByType());
                else
                  showToast(message);
                setState(()=> _isLoading = false);
              },
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
    
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/saler/home/controllers/profileController.dart';
import 'package:graduation_project/saler/home/models/profileModel.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:image_picker/image_picker.dart';
import '../../../constants.dart';

class SettingView extends StatefulWidget {
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  ProfileController _profileController =ProfileController();
  SealerProfileModel  _profileModel =SealerProfileModel();
  String fName,lName,email,password;
  final picker = ImagePicker();
  File image;

  Future getImageCamera() async{
    final file2 = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if(file2 != null){
        image = File(file2.path);
      }else{
        print("no image selected");
      }
    });
  }
  Future getImageGallery() async{
    final file2 = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(file2 != null){
        image = File(file2.path);
        // provider.images.add( File(file2.path));
      }else{
        print("no image selected");
      }
    });
  }

  void _showPickerLogo(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library,color:kPrimaryColor),
                      title: new Text("Gallary",
                        style: TextStyle(fontSize:16, fontFamily: "dinnextl bold",),),
                      onTap: () {
                        getImageGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color:kPrimaryColor),
                    title: new Text("camera",
                      style: TextStyle(fontSize:16, fontFamily: "dinnextl bold",),),
                    onTap: () {
                      getImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  bool loading=true;
  bool rLoading=false;
  void _getProfile()async{
    _profileModel = await _profileController.getProfile();
    setState(() {
      loading=false;
    });
  }
  void _edit()async{
    setState(() {
      rLoading=true;
    });
    _profileModel = await _profileController.editProfile(fName, lName, email, password,image);
    setState(() {
      rLoading=false;
      _getProfile();
    });

  }
  @override
  void initState() {
    _getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: loading?LoadingIndicator():ListView(
        children: [
          CustomAppBar(title: "Profile",),
           SizedBox(height: 30,),
           GestureDetector(
             onTap: (){_showPickerLogo(context);},
             child: CircleAvatar(
               maxRadius: 40,
               backgroundColor: Colors.green,
               child: CircleAvatar(
                 maxRadius: 38,
                 backgroundColor: Colors.white,
                 backgroundImage: image!=null?FileImage(image):
                 NetworkImage("http://eco.ehtwa.site/public/dash/assets/img/${_profileModel.data.image}")
               ),
             ),
           ),
          SizedBox(height: 30,),
          CustomTextField(
            hint: _profileModel.data.firstName,
            onsave: (v){
              setState(() {
                fName=v;
              });
            },
          ),
          CustomTextField(
            hint: _profileModel.data.lastName,
            onsave: (v){
              setState(() {
                lName=v;
              });
            },
          ),
          CustomTextField(
            hint: _profileModel.data.email,
            onsave: (v){
              setState(() {
                email=v;
              });
            },
          ),
          CustomTextField(
            hint: "change password",
            onsave: (v){
              setState(() {
                password=v;
              });
            },
          ),

          SizedBox(height: 30,),
          rLoading?LoadingIndicator():CustomButton(onPressed: (){
           setState(() {
             _edit();
           });
          }, title: "Edit",color: Colors.green,)

        ],
      ),
    );
  }
}

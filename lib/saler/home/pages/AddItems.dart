import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/saler/home/controllers/profileController.dart';
import 'package:graduation_project/saler/home/models/addModel.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:image_picker/image_picker.dart';


class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  String userPhone;
  String carNumber;
  GlobalKey<FormState>_globalKey =GlobalKey<FormState>();
  TextEditingController _controller =TextEditingController();
  TextEditingController _controller1 =TextEditingController();
  TextEditingController _controller2 =TextEditingController();
  final picker = ImagePicker();
  File image;
  String name;
  String category;
  var price;
  String desc;

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
                      leading: new Icon(Icons.photo_library,color:Colors.green),
                      title: new Text("gallery",
                        style: TextStyle(fontSize:16, fontFamily: "dinnextl bold",),),
                      onTap: () {
                        getImageGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera,color:Colors.green),
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
   bool loading = false;
  ProfileController _profileController =ProfileController();
  AddModel _addModel =AddModel();
  void _addProduct()async{
    setState(() {
      loading = true;
    });
    _addModel = await _profileController.addItems(
      image: image,
      desc: desc,
      price: price,
      name: name,
      category: category,
    );
    setState(() {
      image=null;
      _controller.clear();
      _controller1.clear();
      _controller2.clear();
      loading= false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  WillPopScope(
      onWillPop: ()async{
        return exit(0);
      },
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            CustomAppBar(title: "Add Items",logout: true,),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: height*0.05),
                    child: Center(
                      child: Text("Product Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                    ),
                  ),

                  SizedBox(height: height*.05,),
                  GestureDetector(
                    onTap: (){
                      _showPickerLogo(context);
                    },
                    child: Container(
                      height: height*.2,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                         border: Border.all(color: Colors.green),
                      ),
                      child: image==null?Center(
                        child: Icon(Icons.camera_alt_outlined,size: 40,color: kTextColor,),
                      ):Image.file(image,fit: BoxFit.cover,),

                    ),
                  ),
                  SizedBox(height: height*.02,),
                  Container(
                    height: height*.073,
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal:30),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:Border.all(color: Colors.green,width:1) ,
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("select Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
                        DropdownButton(
                            dropdownColor: Colors.white,
                            value: 0,
                            underline: Container(),
                            items: [
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("women",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                onTap: (){
                                  setState(() {
                                    category="women";
                                  });
                                },
                                value:0,
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("man",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                value: 1,
                                onTap: (){
                                  setState(() {
                                    category="man";
                                  });
                                },
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("children",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                value: 2,
                                onTap: (){
                                  setState(() {
                                    category="children";
                                  });
                                },
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("Brand",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                value: 2,
                                onTap: (){
                                  setState(() {
                                    category="Brand";
                                  });
                                },
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("One Brand",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                value: 2,
                                onTap: (){
                                  setState(() {
                                    category="Not a Brand";
                                  });
                                },
                              ),
                            ],
                            onTap: (){
                            },
                            onChanged: (value) {
                              setState(() {

                              });

                            }),
                      ],
                    ),
                  ),

                  CustomTextField(
                      hint: "Product Name",
                      onsave: (v){
                        name=v;
                      },
                    controller: _controller,
                      dIcon: Icons.category,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                    child: Text(
                      "(5% of the price will be counted as app profits)",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),),
                  ),
                  CustomTextField(
                      hint: "Product Price",
                    onsave: (v){
                      price=v;
                    },
                    controller: _controller1,
                    dIcon: Icons.money,
                      ),
                  CustomTextField(
                    hint: "Description",
                    onsave: (v){
                      desc=v;
                    },
                    controller: _controller2,
                    line: true,
                  ),


                  SizedBox(height: height*.07,),
                 loading==true?LoadingIndicator():
                 Builder(
                   builder: (_)=>CustomButton(onPressed: (){
                     if(_globalKey.currentState.validate()&&image!=null&&category!=null){
                       _addProduct();
                       Scaffold.of(_).showSnackBar(SnackBar(
                           backgroundColor: kPrimaryColor,
                           content: Text(
                             "Please Waite for Accept",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14),
                           )));
                     }else{
                       Scaffold.of(_).showSnackBar(SnackBar(
                           backgroundColor: kPrimaryColor,
                           content: Text(
                             "Please Add photo And select Category",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 14),
                           )));

                     }
                   }, title: "Add",color: Colors.green,),
                 )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

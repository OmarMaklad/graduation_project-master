import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/logOut_button.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  Widget _item({String title, Icon iconData}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          iconData,
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Expanded(child: SizedBox()),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Information',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          LogoutButton(darkColor: true,),
        ],
      ),
      body: ListView(
        children: [
          _item(title: 'About us', iconData: Icon(Icons.home)),
          _item(title: 'FAQ', iconData: Icon(Icons.question_answer_outlined)),
          _item(title: 'Contact us', iconData: Icon(Icons.home)),
          _item(title: 'Privacy policy', iconData: Icon(Icons.home)),
          _item(title: 'Prohibited items', iconData: Icon(Icons.home)),
          _item(title: 'Rate our app', iconData: Icon(Icons.star)),
          _item(title: 'Spread the world', iconData: Icon(Icons.share)),
          _item(title: 'Facebook', iconData: Icon(Icons.home)),
          _item(title: 'Twitter', iconData: Icon(Icons.home)),
          _item(title: 'Instagram', iconData: Icon(Icons.home)),

          ],
      ),
    );
  }
}

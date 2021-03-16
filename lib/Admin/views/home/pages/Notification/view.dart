import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/controller.dart';
import 'package:graduation_project/ui_widgets/custom_button.dart';
import 'package:graduation_project/ui_widgets/text_field.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:graduation_project/widgets/toast.dart';

import 'card.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool bothLoading = false;
  bool buyerLoading = false;
  bool selarLoading = false;
  TextEditingController _both = TextEditingController(text: 'Hey');
  TextEditingController _buyer = TextEditingController(text: 'Hey Buyer');
  TextEditingController _selar = TextEditingController(text: 'Hey Selar');
  AdminHomeController _adminHomeController = AdminHomeController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return exit(0);
      },
      child: Column(
        children: [
          CustomAppBar(
            title: "Notifications",
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Send Notification To Saler And Bayer ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  hint: "notification Body",
                  controller: _both,
                ),
                bothLoading
                    ? LoadingIndicator()
                    : CustomButton(
                        onPressed: () async {
                          if (_both.text.isEmpty) return;
                          setState(() => bothLoading = true);
                          await _adminHomeController.notify(
                              'addnot_to_buyer_and_sealer', _both.text);
                          showToast('Notification Sent!');
                          setState(() => bothLoading = false);
                        },
                        color: Colors.green,
                        title: "Send",
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "Send Notification To Saler ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  hint: "notification Body",
                  controller: _selar,
                ),
                selarLoading
                    ? LoadingIndicator()
                    : CustomButton(
                        onPressed: () async {
                          if (_selar.text.isEmpty) return;
                          setState(() => selarLoading = true);
                          await _adminHomeController.notify(
                              'addnot_to_sealer', _selar.text);
                          showToast('Notification Sent!');
                          //addnot_to_buyer
                          setState(() => selarLoading = false);
                        },
                        color: Colors.green,
                        title: "Send",
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text(
                    "Send Notification To  Bayer ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  hint: "notification Body",
                  controller: _buyer,
                ),
                buyerLoading
                    ? LoadingIndicator()
                    : CustomButton(
                        onPressed: () async {
                          if (_buyer.text.isEmpty) return;
                          setState(() => buyerLoading = true);
                          await _adminHomeController.notify(
                              'addnot_to_buyer', _buyer.text);
                          showToast('Notification Sent!');
                          setState(() => buyerLoading = false);
                        },
                        color: Colors.green,
                        title: "Send",
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

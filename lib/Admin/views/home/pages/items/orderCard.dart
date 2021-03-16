import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/controller.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:graduation_project/widgets/smallButton.dart';
import 'package:graduation_project/widgets/toast.dart';
import '../../../../../constants.dart';

class OrderCard extends StatefulWidget {
  final String itemName;
  final String selarName;
  final String image;
  final int orderId;
  final Function onAction;
  OrderCard({this.itemName, this.selarName, this.image, this.orderId, this.onAction});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  AdminHomeController _adminHomeController = AdminHomeController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.height * .2,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  //TODO: change image url
                  // image: DecorationImage(
                  //   image: NetworkImage(image),
                  // )
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Items Name: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: kTextColor),
                  ),
                  Text(
                    widget.itemName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Selar Name: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: kTextColor),
                  ),
                  Text(
                     widget.selarName,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          _isLoading ? LoadingIndicator() : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallButton(
                onPressed: ()async {
                  setState(()=> _isLoading = true);
                  await AdminHomeController().acceptOrder(widget.orderId);
                  showToast('Accepted!');
                  setState(()=> _isLoading = false);
                  widget.onAction();
                },
                title: "Accept",
                color: Colors.green,
              ),
              SmallButton(
                onPressed: ()async {
                  setState(()=> _isLoading = true);
                  await AdminHomeController().cancelOrder(widget.orderId);
                  showToast('Refused!');
                  setState(()=> _isLoading = false);
                  widget.onAction();
                },
                title: "Reject",
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:graduation_project/core/router.dart';
import 'package:graduation_project/relockMaker/orderDetails/controller.dart';
import 'package:graduation_project/relockMaker/orderDetails/model.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:graduation_project/widgets/smallButton.dart';
import 'package:graduation_project/widgets/toast.dart';

class ReLockMakerOrderDetailsView extends StatefulWidget {
  final int orderId;
  ReLockMakerOrderDetailsView(this.orderId);

  @override
  _ReLockMakerOrderDetailsViewState createState() =>
      _ReLockMakerOrderDetailsViewState();
}

class _ReLockMakerOrderDetailsViewState
    extends State<ReLockMakerOrderDetailsView> {
  bool _pageIsLoading = true;
  bool _buttonsIsLoading = false;
  MakerOrderDetailsController _makerOrderDetailsController =
      MakerOrderDetailsController();
  MakerOrderDetailsModel _makerOrderDetailsModel;
  String price;
  final key = GlobalKey<FormState>();
  @override
  void initState() {
    getOrder();
    super.initState();
  }

  getOrder() async {
    _makerOrderDetailsModel =
        await _makerOrderDetailsController.getOrder(widget.orderId);
    setState(() => _pageIsLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(
          title: 'Order Details',
        ),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      ),
      body: _pageIsLoading
          ? LoadingIndicator()
          : ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'BuyerName : ${_makerOrderDetailsModel.data.buyerFirstName + ' ' + _makerOrderDetailsModel.data.buyerLastName}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Days : ${_makerOrderDetailsModel.data.days}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(_makerOrderDetailsModel.data.desc),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price : ',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Form(
                            key: key,
                            child: CustomTextField(
                              hint: 'EX: 1520',
                              valid: (v) => v.isEmpty ? 'Empty field!' : null,
                              onsave: (v) => price = v,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    _buttonsIsLoading ? LoadingIndicator() : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: SmallButton(
                          onPressed: () async{
                            key.currentState.save();
                            if(!key.currentState.validate()) return;
                            setState(()=> _buttonsIsLoading = true);
                            final message = await _makerOrderDetailsController.accept(widget.orderId,price);
                            setState(()=> _buttonsIsLoading = false);
                            if(message == 'ok') {
                              showToast('Accepted!');
                              MagicRouter.pop();
                            }else
                              showToast(message);
                          },
                          title: 'Accept',
                          color: Colors.green,
                        )),
                        Expanded(
                            child: SmallButton(
                              onPressed: () async{
                                setState(()=> _buttonsIsLoading = true);
                                final message = await _makerOrderDetailsController.cancel(widget.orderId);
                                setState(()=> _buttonsIsLoading = false);
                                if(message == 'ok') {
                                  showToast('Refused!');
                                  MagicRouter.pop();
                                }else
                                  showToast(message);
                              },
                          title: 'Reject',
                          color: Colors.red,
                        )),
                      ],
                    ),
                  ],
                ),
    );
  }
}

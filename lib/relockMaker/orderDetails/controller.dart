import 'package:graduation_project/constants.dart';
import 'package:graduation_project/relockMaker/orderDetails/model.dart';

class MakerOrderDetailsController {

  MakerOrderDetailsModel _makerOrderDetailsModel = MakerOrderDetailsModel();

  Future<MakerOrderDetailsModel> getOrder(int id)async{
    final response = await dioPost('show_maker_order',body: {'maker_order_id':id});
    _makerOrderDetailsModel = MakerOrderDetailsModel.fromJson(response.data);
    return _makerOrderDetailsModel;
  }

  Future<String> accept(int id,String price)async{
    final response = await dioPost('accept_maker_order',body: {'maker_order_id':id,'price':price});
    if(response.statusCode == 200)
      if(response.data['msg'] == 'success')return 'ok';
      else return 'Something went wrong!';
    else
      return 'Something went wrong!';
  }

  Future<String> cancel(int id)async{
    final response = await dioPost('refuse_maker_order',body: {'maker_order_id':id});
    if(response.statusCode == 200)
      if(response.data['msg'] == 'success')return 'ok';
      else return 'Something went wrong!';
    else
      return 'Something went wrong!';
  }

}
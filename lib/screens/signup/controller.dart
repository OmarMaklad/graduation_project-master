import 'package:graduation_project/core/start_chat_controller.dart';
import 'package:graduation_project/screens/signup/model.dart';
import '../../constants.dart';

class SignUpController {
  
  Future<String> signUp({
  String email,
    String password,
    String firstName,
    String lastName,
    String type,
})async{
    final response = await dioPost('register',body: {
      'first_name':firstName,
      'last_name':lastName,
      'email':email,
      'password':password,
      'password confirmation':password,
      'type': type
    });
    if(response.statusCode == 200){
      if (response.data['msg'] == 'error')
        return response.data['data'];
      else{
        final _model = SignUpModel.fromJson(response.data);
        final user = _model.data.user;
        await loggedUser.setUser(
          firstName: user.firstName,
          lastName: user.lastName,
          image: user.image,
          type: user.type,
          email: user.email,
          apiToken: user.apiToken,
          id: user.id,
          isLogged: true,
        );
        StartChatController().startChat(SERVICE_ID);
        if(loggedUser.type == 'buyer')
          StartChatController().startChat(MAKER_ID);
        return 'ok';
      }
    }else
      return DefaultErrorMessage;
}
  
}
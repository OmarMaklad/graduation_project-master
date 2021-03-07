import 'package:http/http.dart' as http;

class ForgetPasswordController {
  final url = 'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyCLzczN22VvcDPPL2_MsxvylIVMouu_rP4';

  Future<String> resetPassword(String email)async{
    final response = await http.post(url,body: {
      "email": email,
      "requestType":"PASSWORD_RESET",
    });
    if(response.statusCode == 200){
      return 'Password reset email has sent to : $email';
    }else{
      return 'Failed to send reset email to : $email';
    }
  }
}

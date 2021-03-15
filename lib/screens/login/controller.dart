import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/login/model.dart';

class LoginController {
  Future<String> login(String email, String password) async {
    final response = await dioPost('login', body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      if (response.data['msg'] == 'error')
        return response.data['data'];
      else {
        final _model = LoginModel.fromJson(response.data);
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
        return 'ok';
      }
    } else
      return DefaultErrorMessage;
  }
}

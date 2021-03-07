import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class LoginController {
  LoginModel _loginModel = LoginModel();

  Future<LoginModel> userLogin(
      {String email,
      String password,
      String base,
      String name,
      String phone}) async {
    http.Response response;
    var userId;
    var idToken;
    var userDecodedInfo;
    final String photo =
        "https://uploads-ssl.webflow.com/55af217e059671c578b90173/562b95fe3ac98da060c60187_person_pec.png";
    try {
      if (base == "signIn") {
        response = await http.post(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCLzczN22VvcDPPL2_MsxvylIVMouu_rP4',
            body: json.encode({
              'email': email,
              'password': password,
              'returnSecureToken': true
            }));
        userId = json.decode(response.body)['localId'];
        idToken = json.decode(response.body)['idToken'];
        var request = await http.get(
            "https://tl33ny.firebaseio.com/users/$userId.json?auth=$idToken");

        userDecodedInfo = json.decode(request.body);
      } else {
        response = await http.post(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCLzczN22VvcDPPL2_MsxvylIVMouu_rP4',
            body: json.encode({
              'email': email,
              'password': password,
              'displayName': name,
              'returnSecureToken': true
            }));

        userId = json.decode(response.body)['localId'];
        idToken = json.decode(response.body)['idToken'];
        await http.patch(
            'https://tl33ny.firebaseio.com/users/$userId.json?auth=$idToken',
            body: json.encode({
              'email': email,
              'displayName': name,
              'photoUrl': photo,
              'phone': phone,
            }));
      }

      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);

        _loginModel = LoginModel.fromJson(responseJson);

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('localId', _loginModel.localId);
        sharedPreferences.setString('name', _loginModel.displayName);
        sharedPreferences.setString('email', _loginModel.email);
        sharedPreferences.setString('phone', userDecodedInfo['phone']);
        sharedPreferences.setString('photo', userDecodedInfo['photoUrl']);
        sharedPreferences.setString('idToken', _loginModel.idToken);
        sharedPreferences.setString('refreshToken', _loginModel.refreshToken);
        int _expiryDate = DateTime.now()
            .add(Duration(seconds: int.parse(_loginModel.expiresIn)))
            .millisecondsSinceEpoch;
        sharedPreferences.setInt('expiryDate', _expiryDate);
      }
    } catch (e) {
      print(e);
    }
    return _loginModel;
  }

  Future<void> tryLogin(Function failedToLogin) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getInt('expiryDate') != null) {
      DateTime dateTime = DateTime.now();
      DateTime expiryDate =
          DateTime.fromMillisecondsSinceEpoch(_prefs.getInt('expiryDate'));
      print(_prefs.getString('idToken'));
      print(expiryDate);
      try {
        if (expiryDate.isBefore(dateTime)) {
          String refreshToken = _prefs.getString('refreshToken');
          const String url =
              'https://securetoken.googleapis.com/v1/token?key=AIzaSyCLzczN22VvcDPPL2_MsxvylIVMouu_rP4';
          final response = await http.post(url,
              body: jsonEncode({
                "grant_type": "refresh_token",
                "refresh_token": refreshToken
              }));
          final decodedAuthInfo = jsonDecode(response.body);
          int _expiryDate = DateTime.now()
              .add(Duration(seconds: int.parse(decodedAuthInfo['expires_in'])))
              .millisecondsSinceEpoch;
          _prefs.setString('idToken', decodedAuthInfo['access_token']);
          _prefs.setString('refreshToken', decodedAuthInfo['refresh_token']);
          _prefs.setInt('expiryDate', _expiryDate);
        } else if (expiryDate.isAfter(dateTime)) {
          print('authenticated');
        }
      } catch (_) {
        print('failed to login');
        _prefs.clear();
        failedToLogin();
      }
    }
  }
}

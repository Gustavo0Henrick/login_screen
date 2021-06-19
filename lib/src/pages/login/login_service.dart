import 'package:http/http.dart' as http;
import 'package:login_screen/src/core/constants/routes.dart';
import 'dart:convert';

class LoginService {
  login(String email, String password) async {
    http.Response response = await http.post(Routes.signIn,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(response.body);
  }
}

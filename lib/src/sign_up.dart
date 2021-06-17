import 'package:http/http.dart' as http;
import 'package:login_screen/src/constants/routes.dart';
import 'dart:convert';

class SignUp {
  signUp(String email, String password) async {
    Uri uri = Uri.https(Routes.signUp, "/");
    http.Response response = await http.post(uri,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }));
    print(response.body);
  }
}

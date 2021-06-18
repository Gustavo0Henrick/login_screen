import 'package:flutter/material.dart';
import 'package:login_screen/src/core/component/custom_textformfield.dart';
import 'package:login_screen/src/core/component/gradient_button.dart';
import 'package:login_screen/src/core/component/password_field.dart';
import 'package:login_screen/src/core/constants/colors.dart';
import 'package:login_screen/src/core/constants/images.dart';
import 'package:login_screen/src/core/constants/preferences_key.dart';
import 'package:login_screen/src/core/models/login_model.dart';
import 'package:login_screen/src/pages/register/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color gradientColor1 = Colors.orange[400];
  Color gradientColor2 = Colors.orange[900];

  bool remember = false;
  bool isPassword = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, bottom: 30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              child: Image.asset(CustomImages.arvore),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: CustomTextFormField(
                        // validator: () {},
                        controller: _email,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Senha",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    PasswordField(
                      controller: _password,
                      password: isPassword,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: GradientButton(
                        borderRadius: 5,
                        onPressed: () {
                          _doLogin();
                        },
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: CustomColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.8,
                        gradient: LinearGradient(
                          colors: [
                            gradientColor1,
                            gradientColor2,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: remember,
                                    onChanged: (bool newValue) {
                                      setState(() {
                                        remember = newValue;
                                      });
                                    }),
                                Text(
                                  "Lembrar usuário",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: InkWell(
                                enableFeedback: true,
                                onTap: () {},
                                child: Text(
                                  "Esqueceu a senha?",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 120),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Não tem uma conta?",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: InkWell(
                                enableFeedback: true,
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              RegisterPage()));
                                },
                                child: Text(
                                  "Cadastre-se",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: CustomColors.mainColor),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    String emailForm = this._email.text;
    String passwordForm = this._password.text;

    LoginModel savedUser = await _getSavedUser();
    if (emailForm == savedUser.email && passwordForm == savedUser.password) {
      print("LOGIN SUCESS");
    } else {
      print("LOGIN FAIL");
    }
  }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonUser = prefs.getString(PreferencesKeys.activeUser);
    // print(jsonUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser);
    LoginModel user = LoginModel.fromJson(mapUser);
    return user;
  }
}

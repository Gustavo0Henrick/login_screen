import 'package:flutter/material.dart';
import 'package:login_screen/src/core/component/custom_textformfield.dart';
import 'package:login_screen/src/core/component/gradient_button.dart';
import 'package:login_screen/src/core/constants/colors.dart';
import 'package:login_screen/src/core/constants/images.dart';
import 'package:login_screen/src/core/constants/preferences_key.dart';
import 'package:login_screen/src/core/models/login_model.dart';
import 'package:login_screen/src/pages/login/login_page.dart';
import 'package:login_screen/src/core/component/password_field.dart';
import 'package:login_screen/src/pages/register/register_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double _height = 40;

  Color gradientColor1 = Colors.orange[400];
  Color gradientColor2 = Colors.orange[900];
  final _formKey = GlobalKey<FormState>();

  bool valueCheck = false;
  bool isPassword = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmedPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
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
                      padding: EdgeInsets.only(top: 30, bottom: 15),
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
                      "Nome",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: CustomTextFormField(
                        inputType: TextInputType.name,
                        height: _height,
                        validator: (value) {
                          if (value.length < 2) {
                            return "Insira um Nome válido";
                          }
                          return null;
                        },
                        controller: _name,
                      ),
                    ),
                    Text(
                      "Sobrenome",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: CustomTextFormField(
                        inputType: TextInputType.name,
                        height: _height,
                        validator: (value) {
                          if (value.length < 2) {
                            return "Insira um Sobrenome válido";
                          }
                          return null;
                        },
                        controller: _lastName,
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
                        inputType: TextInputType.emailAddress,
                        height: _height,
                        validator: (value) {
                          if (value.length < 5) {
                            return "Insira um Email válido";
                          } else if (!value.contains("@")) {
                            return "Email Inválido";
                          }
                          return null;
                        },
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
                      inputType: TextInputType.text,
                      height: _height,
                      validator: (value) {
                        if (value.length < 6) {
                          return "Senha inválida";
                        }
                        return null;
                      },
                      controller: _password,
                      password: isPassword,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        "Confirme a senha",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    PasswordField(
                      inputType: TextInputType.text,
                      height: _height,
                      validator: (value) {
                        if (value != _password.text) {
                          return "Senhas Diferentes";
                        } else if (value == '') {
                          return "Insira a senha";
                        }
                        return null;
                      },
                      controller: _confirmedPassword,
                      password: isPassword,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: valueCheck,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    valueCheck = newValue;
                                  });
                                }),
                            Text(
                              "Aceito os Termos de Uso",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 60),
                      child: GradientButton(
                        borderRadius: 5,
                        onPressed: valueCheck
                            ? () {
                                setState(() {
                                  _doSignUp();
                                });
                              }
                            : null,
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            color: CustomColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.8,
                        gradient: valueCheck
                            ? LinearGradient(
                                colors: [
                                  gradientColor1,
                                  gradientColor2,
                                ],
                              )
                            : LinearGradient(
                                colors: [
                                  Colors.grey[400],
                                  Colors.grey[700],
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Já tem uma conta?",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: InkWell(
                                enableFeedback: true,
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => LoginPage()));
                                },
                                child: Text(
                                  "Entrar",
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

  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState.validate()) {
      SignUpService().signUp(
        _email.text,
        _password.text,
      );
    } else {
      print("Invalida");
    }
  }
}

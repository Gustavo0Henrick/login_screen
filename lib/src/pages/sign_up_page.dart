import 'package:flutter/material.dart';
import 'package:login_screen/src/component/custom_textformfield.dart';
import 'package:login_screen/src/component/gradient_button.dart';
import 'package:login_screen/src/constants/colors.dart';
import 'package:login_screen/src/constants/images.dart';
import 'package:login_screen/src/pages/login_page.dart';
import 'package:login_screen/src/component/password_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool valueCheck = false;
  bool isPassword = true;
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
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
                      controller: name,
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
                      controller: lastName,
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
                      controller: email,
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
                    controller: password,
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
                    controller: confirmedPassword,
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
                    padding: EdgeInsets.only(top: 30),
                    child: GradientButton(
                      borderRadius: 5,
                      onPressed: () {},
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
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange[200],
                          Colors.orange[700],
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
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
            ],
          ),
        ),
      ),
    );
  }
}

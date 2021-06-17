import 'package:flutter/material.dart';
import 'package:login_screen/src/component/custom_textformfield.dart';
import 'package:login_screen/src/component/gradient_button.dart';
import 'package:login_screen/src/pages/loginpage.dart';
import 'package:login_screen/src/component/password_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPassword = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 200),
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
                    padding: EdgeInsets.only(top: 15),
                    child: GradientButton(
                      borderRadius: 5,
                      onPressed: () {},
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                          color: Colors.white,
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
                  SizedBox(height: 90),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Já tem uma conta?"),
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
                                    color: Colors.orange),
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

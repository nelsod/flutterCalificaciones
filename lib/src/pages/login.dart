import 'package:calificaciones/src/api/auth_login.dart';
import 'package:calificaciones/src/widgets/circle.dart';
import 'package:calificaciones/src/widgets/inputsText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  var _username = '', _password = '';
  final _authLogin = AuthLogin();
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit() async {
    final isValid = _formKey.currentState
        .validate(); //Siempre asignar el fromKey al widget Form

    if (isValid) {
      final isOk = await _authLogin.loginVerificar(
          username: _username, password: _password, context: context);

      if (isOk) {
        Navigator.pushNamed(context, 'home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -size.width * 0.22,
                top: -size.width * 0.35,
                child: Circle(
                  colors: [Colors.lightGreenAccent, Colors.greenAccent],
                  radius: size.width * 0.45,
                ),
              ),
              Positioned(
                left: -size.width * 0.15,
                top: -size.width * 0.34,
                child: Circle(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                  radius: size.width * 0.35,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                  top: size.width * 0.30,
                                  bottom: size.width * 0.07),
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26, blurRadius: 18)
                                  ]),
                            ),
                            Text(
                              "Bienvenido",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth: 350, minWidth: 350),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      InputText(
                                        validator: (String text) {
                                          if (RegExp(r'^[a-zA-Z0-9]+$')
                                                  .hasMatch(text) &&
                                              !text.contains("#")) {
                                            _username = text;
                                            return null;
                                          }
                                          return 'Usuario Incorrecto';
                                        },
                                        label: 'Usuario',
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                      InputText(
                                        isSecured: true,
                                        validator: (String text) {
                                          if (text.isNotEmpty &&
                                              text.length > 5) {
                                            _password = text;
                                            return null;
                                          }
                                          return "Contraseña Incorrecta";
                                        },
                                        label: 'Contraseña',
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: 350, minWidth: 350),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(5),
                                child: Text(
                                  "Iniciar sesion",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                onPressed: () => _submit(),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.12,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

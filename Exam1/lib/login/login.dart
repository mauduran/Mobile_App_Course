import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _nameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).primaryColorDark,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 40.0, 0, 60.0),
              child: Image.asset('assets/images/cupping_sm.png'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nombre Completo:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        fillColor: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Password:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 2,
                        fontFamily: 'Open Sans'),
                    controller: _passwordController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  RaisedButton(
                    onPressed: () {
                      if (_nameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (r) => false);
                      }
                    },
                    child: Text('ENTRAR'),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "¿Olvidaste tu password?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(height: 100),
                        Text(
                          "Aún no tienes una cuenta?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/signup');
                            },
                            child: Text(
                              "REGÍSTRATE",
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

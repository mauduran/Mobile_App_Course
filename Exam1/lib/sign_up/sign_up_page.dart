import 'package:estructura_practica_1/colors.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _acceptTerms = false;
  var _showPassword = false;

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
              padding: EdgeInsets.fromLTRB(0, 40.0, 0, 20.0),
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
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
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
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                    obscureText: !_showPassword,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 2,
                        fontFamily: 'Open Sans'),
                    controller: _passwordController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        child: Icon(
                          (_showPassword)
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: c_brown,
                        ),
                      ),
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
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          onChanged: (bool newValue) {
                            setState(() {
                              _acceptTerms = newValue;
                            });
                          },
                          value: _acceptTerms,
                          activeColor: c_brown),
                      Text(
                        'ACEPTO LOS TERMINOS Y CONDICIONES DE USO',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_nameController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _acceptTerms) {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (r) => false);
                      }
                    },
                    child: Text('REGISTRATE'),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Ya tienes una cuenta?",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                            child: Text(
                              "INGRESA",
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

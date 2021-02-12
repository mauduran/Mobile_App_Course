import 'package:flutter/material.dart';

class AccountAccessPage extends StatefulWidget {
  AccountAccessPage({Key key}) : super(key: key);

  @override
  _AccountAccessPageState createState() => _AccountAccessPageState();
}

class _AccountAccessPageState extends State<AccountAccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 100.0),
              child: Image.asset('assets/images/cupping_sm.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF8B8175),
                      Color(0xFFBCB0A1),
                    ],
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  height: 60,
                  child: Text(
                    "REGISTRATE",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF8B8175),
                      Color(0xFFBCB0A1),
                    ],
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  height: 60,
                  child: Text(
                    "INGRESA",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

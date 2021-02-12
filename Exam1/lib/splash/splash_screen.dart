import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000),
        () => Navigator.of(context).pushReplacementNamed('/access'));
    // Home(title: APP_TITLE)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/coffee_bg.png')),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/images/cupping_sm.png'),
            Spacer(),
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }
}

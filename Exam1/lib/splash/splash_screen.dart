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

// Container(
//   constraints: BoxConstraints.expand(),
//   decoration: BoxDecoration(
//   image: DecorationImage(
// 	image: NetworkImage("https://flutter-examples.com/wp-content/uploads/2020/02/dice.jpg"),
//   fit: BoxFit.cover)
//   ),
//   child: Center(child: Text('Set Full Screen Background Image in Flutter',
// 	textAlign: TextAlign.center, style:
// 	TextStyle(color: Colors.brown, fontSize: 25, fontWeight: FontWeight.bold),),)
//    )
  }
}

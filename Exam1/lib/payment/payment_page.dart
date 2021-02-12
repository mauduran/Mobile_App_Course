import 'package:estructura_practica_1/profile/profile.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _dialog = (context) => AlertDialog(
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.only(right: 6),
        title: Container(
          height: 200,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Image.network(
                'https://cdn.luxe.digital/media/2020/05/07203610/best-coffee-beans-luxe-digital.jpg',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.center,
                child: Theme(
                  data: ThemeData(canvasColor: Colors.transparent),
                  child: Chip(
                    label: Text(
                      "Activo",
                      style: TextStyle(
                          color: Color(0xFF6E62EE),
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Color(0xFF6E62EE),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              child: Row(children: [
                CircleAvatar(
                  child: Image.asset(
                    'assets/images/cupping_sm_black_2.png',
                    fit: BoxFit.cover,
                  ),
                  backgroundColor: Color(0xFFE6DFD5),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Orden Exitosa",
                      style: Theme.of(context).textTheme.headline6,
                    )
                  ],
                )
              ]),
            ),
            Container(
              padding: EdgeInsets.only(left: 8, right: 12),
              child: Text(
                "Tu orden ha sido registrada, para más información busca en la opción historial de compras en tu perfil.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                ),
              ),
            )
          ],
        ),
        actions: [
          FlatButton(
            textColor: Color(0xFF6200EE),
            onPressed: () => Navigator.pop(context),
            child: Text('ACEPTAR'),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * .8,
        child: Drawer(child: Profile()),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Elige tu método de pago:",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                showDialog<void>(
                    context: context, builder: (context) => _dialog(context));
              },
              child: Material(
                elevation: 10,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        c_brown,
                        c_brown_light,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 12, 12, 12),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.credit_card,
                            color: Colors.black,
                            size: 72,
                          ),
                        ),
                        Positioned(
                          left: 100,
                          top: 10,
                          child: Container(
                            width: 170,
                            child: Text("Tarjeta de Crédito",
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(Icons.launch_outlined),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                showDialog<void>(
                    context: context, builder: (context) => _dialog(context));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.centerLeft,
                    colors: [
                      c_brown,
                      c_brown_light,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 12, 12, 12),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 72,
                          child: Image.asset(
                            'assets/images/paypal_logo.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 10,
                        child: Container(
                          width: 170,
                          child: Text(
                            "PayPal",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.launch_outlined),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                showDialog<void>(
                    context: context, builder: (context) => _dialog(context));
              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.centerLeft,
                    colors: [
                      c_brown,
                      c_brown_light,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24, 12, 12, 12),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.card_giftcard,
                          color: Colors.black,
                          size: 72,
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 10,
                        child: Container(
                          width: 170,
                          child: Text(
                            "Tarjeta de Regalo",
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.launch_outlined),
                      )
                    ],
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

class DateFormat {}

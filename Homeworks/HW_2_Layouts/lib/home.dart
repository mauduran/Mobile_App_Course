import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _likes = 999;
  var _isLiked = false;
  var _isDisliked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ITESO App'),
      ),
      body: Builder(
        builder: (ctx) => Column(
          children: [
            Image.asset('assets/images/iteso_logo.jpg'),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("San Pedro, Tlaquepaque")
                      ],
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: _isLiked ? Colors.blue : Colors.grey,
                      ),
                      splashRadius: 10,
                      onPressed: () {
                        setState(() {
                          _likes++;
                          _isLiked = !_isLiked;
                        });

                        // SystemNavigator.pop(animated: true);
                      }),
                  Text("$_likes"),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down,
                      color: _isDisliked ? Colors.red : Colors.grey,
                    ),
                    splashRadius: 10,
                    onPressed: () {
                      setState(() {
                        _likes--;
                        _isDisliked = !_isDisliked;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    IconButton(
                      icon: Icon(
                        Icons.mail,
                      ),
                      iconSize: 36,
                      onPressed: () {
                        Scaffold.of(ctx).hideCurrentSnackBar();
                        Scaffold.of(ctx).showSnackBar(SnackBar(
                          content: Text("Enviar correo"),
                          duration: Duration(milliseconds: 1500),
                          action: SnackBarAction(
                            label: "Close",
                            onPressed: () {},
                          ),
                        ));
                      },
                    ),
                    Text("Correo"),
                  ]),
                  Column(children: [
                    IconButton(
                      icon: Icon(
                        Icons.phone,
                      ),
                      iconSize: 36,
                      onPressed: () {
                        Scaffold.of(ctx).hideCurrentSnackBar();
                        Scaffold.of(ctx).showSnackBar(SnackBar(
                          content: Text("Hacer llamada"),
                          duration: Duration(milliseconds: 1500),
                          action: SnackBarAction(
                            label: "Close",
                            onPressed: () {},
                          ),
                        ));
                      },
                    ),
                    Text("Llamada"),
                  ]),
                  Column(children: [
                    IconButton(
                      icon: Icon(
                        Icons.directions,
                      ),
                      iconSize: 36,
                      onPressed: () {
                        Scaffold.of(ctx).hideCurrentSnackBar();
                        Scaffold.of(ctx).showSnackBar(SnackBar(
                          content: Text("Ir al ITESO"),
                          duration: Duration(milliseconds: 1500),
                          action: SnackBarAction(
                            label: "Close",
                            onPressed: () {},
                          ),
                        ));
                      },
                    ),
                    Text("Ruta"),
                  ]),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog<void>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Información'),
                              content: Text(_likes % 2 == 0
                                  ? 'El contador de likes es par'
                                  : DateFormat(
                                          "'Fecha:' dd/MM/yyyy\n\n'Hora:' H:m:s")
                                      .format(DateTime.now())),
                              actions: [
                                FlatButton(
                                  textColor: Color(0xFF6200EE),
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.info),
                        iconSize: 48,
                        splashRadius: 30,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.',
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

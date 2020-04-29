import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Pessoas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _qtdePessoas = 0;
  String _message = "Ta Vazio";

  void _changeQtdePessoas(int variante) {
    setState(() {
      _qtdePessoas += variante;

      if (_qtdePessoas <= 0) {
        _message = "Ta Vazio";
        _qtdePessoas = 0;
      } else if (_qtdePessoas < 5) {
        _message = "Pode entrar";
      } else if (_qtdePessoas == 5) {
        _message = "Ta lotado";
        _qtdePessoas = 5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/fundo_supermecado.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_qtdePessoas",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.2),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 35.0, color: Colors.red),
                    ),
                    onPressed: () {
                      _changeQtdePessoas(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.2),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 35.0, color: Colors.red),
                    ),
                    onPressed: () {
                      _changeQtdePessoas(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _message,
              style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0),
            ),
          ],
        ),
      ],
    );
  }
}

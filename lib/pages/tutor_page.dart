import 'package:flutter/material.dart';
import 'package:friendlychat/model/chat_screen.dart';

import 'package:friendlychat/models/producto_model.dart';
import 'package:friendlychat/widget/estrellas.dart';

class TutorPage extends StatefulWidget {
  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData =
        ModalRoute.of(context).settings.arguments; // argumentos
    if (prodData != null) {
      producto = prodData;
    }

    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen('Friendly Chat')),
                );
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[_infoFoto(), _info(), _info()],
          ),
        ),
      ),
    );
  }

  Widget _infoFoto() {
    return Row(
      children: [
        Expanded(child: Container()),
        Container(
            alignment: Alignment.center,
            height: 150.0,
            width: 150.0,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(150.0 / 2),
                image: new DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: (producto.fotoUrl == null || producto.fotoUrl == '')
                      ? Image(image: AssetImage('assets/no-image.png'))
                      : NetworkImage(producto.fotoUrl),
                ))),
        Expanded(child: Container()),
      ],
    );
  }

  Widget _info() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
        ),
        Text('${producto.nombre} ${producto.apellido}'.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis),
        estrella(producto.estrellas),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        Text(
          '${producto.valor.toStringAsFixed(2)} \$/hora',
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              producto.descripcion,
              textAlign: TextAlign.justify,
            )),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
        ),
      ],
    );
  }
}

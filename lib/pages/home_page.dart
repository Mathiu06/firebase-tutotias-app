import 'package:flutter/material.dart';

import 'package:friendlychat/bloc/provider.dart';
import 'package:friendlychat/model/chat_screen.dart';
import 'package:friendlychat/models/producto_model.dart';
import 'package:friendlychat/service/authentication.dart';
import 'package:friendlychat/widget/estrellas.dart';
import 'package:friendlychat/widget/foto_perfil.dart';

import '../preferencias_usuario/preferencias_usuario.dart';
import '../providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  HomePage(String title, {Key key, this.auth, this.userId, this.onSignedOut})
      : _title = title,
        super(key: key);

  final _title;
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  Widget build(BuildContext context) {
    final _prefs = new PreferenciasUsuario();
    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();
//TODO: regresar al login
    ProductosProvider().cargarProductos().then((value) {
      // print(value);
      if (value.isEmpty || value == null) {
        // Navigator.pushReplacementNamed(context, 'login');
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) =>
                _crearItem(context, productosBloc, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc productosBloc,
      ProductoModel producto) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'tutor', arguments: producto),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: fotoPerfil(producto),
              title: Text(
                '${producto.nombre} ${producto.apellido}',
                textAlign: TextAlign.start,
              ),
              subtitle: Row(
                children: [
                  Text('${producto.valor.toStringAsFixed(2)} \$/hora'),
                  Expanded(child: estrella(producto.estrellas)),
                ],
              ),
              trailing: Icon(Icons.format_indent_increase),
            ),
          ],
        ),
      ),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.pushNamed(context, 'producto');
        });
  }

  void _select(Choice choice) {
    switch (choice.title) {
      case 'Sign out':
        _signOut();
        break;
    }
  }

  void _signOut() async {
    final _prefs = new PreferenciasUsuario();
    _prefs.token = '';
    print(_prefs.token);
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print('+++++++++++++++++++++++++++++++++++++++++++');
      print(e);
    }
  }
}

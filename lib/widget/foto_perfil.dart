import 'package:flutter/material.dart';

import 'package:friendlychat/models/producto_model.dart';

Widget fotoPerfil(ProductoModel producto) {
  return (producto.fotoUrl == null || producto.fotoUrl == '')
      ? Image(image: AssetImage('assets/no-image.png'))
      : FadeInImage(
          image: NetworkImage(producto.fotoUrl),
          placeholder: AssetImage('assets/jar-loading.gif'),
          // height: 300.0,
          // width: double.infinity,
          fit: BoxFit.cover,
        );
}

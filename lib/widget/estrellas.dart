import 'package:flutter/material.dart';

Row estrella(double estrellas) {
  // final double estrellas = 4.6;

  if (estrellas <= 0.5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star_half),
      ],
    );
  } else if (estrellas > 0.5 && estrellas <= 1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star),
      ],
    );
  } else if (estrellas > 1.0 && estrellas <= 1.5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star),
        Icon(Icons.star_half),
      ],
    );
  } else if (estrellas > 1.5 && estrellas <= 2.0) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.star), Icon(Icons.star)],
    );
  } else if (estrellas > 2.0 && estrellas <= 2.5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.star), Icon(Icons.star), Icon(Icons.star_half)],
    );
  } else if (estrellas > 2.5 && estrellas <= 3.0) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.star), Icon(Icons.star), Icon(Icons.star)],
    );
  } else if (estrellas > 3.0 && estrellas <= 3.5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star_half)
      ],
    );
  } else if (estrellas > 3.5 && estrellas <= 4.0) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star)
      ],
    );
  } else if (estrellas > 4.0 && estrellas <= 4.5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star_half)
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star),
        Icon(Icons.star)
      ],
    );
  }
}

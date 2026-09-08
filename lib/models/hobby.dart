import 'package:flutter/material.dart';

// Modelo que representa un hobby dentro de la aplicación
class Hobby {
  final String nombre;
  final IconData icono;
  bool favorito;

  Hobby({
    required this.nombre,
    required this.icono,
    this.favorito = false,
  });
}
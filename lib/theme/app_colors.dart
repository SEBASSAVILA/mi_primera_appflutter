import 'package:flutter/material.dart';

// Paleta de colores personalizada de la app
class AppColors {
  // Colores de la Actividad 1 (perfil)
  static const Color terracota = Color(0xFFC1603C);
  static const Color terracotaOscuro = Color(0xFF8C4530);
  static const Color beige = Color(0xFFF5EBE0);
  static const Color crema = Color(0xFFFFF8F0);

  // Colores del gradiente (Actividad 1)
  static const Color gradienteRosa = Color(0xFFF7599E);
  static const Color gradienteMorado = Color(0xFF444FC7);
  static const Color gradienteCeleste = Color(0xFF94BBE9);

  // Gradiente reutilizable
  static const RadialGradient fondoGradiente = RadialGradient(
    center: Alignment.center,
    radius: 1.0,
    colors: [gradienteRosa, gradienteMorado, gradienteCeleste],
    stops: [0.0, 0.83, 1.0],
  );
}
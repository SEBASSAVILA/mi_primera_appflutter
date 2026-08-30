import 'package:flutter/material.dart';

// Paleta de colores personalizada de la app - tema morado/cian (música/neon)
class AppColors {
  // Color principal (antes terracota) -> ahora violeta vibrante
  static const Color terracota = Color(0xFF7C3AED);
  // Color oscuro de acento (antes terracotaOscuro) -> índigo profundo
  static const Color terracotaOscuro = Color(0xFF4C1D95);
  // Fondo de pantallas (antes beige) -> lavanda muy claro
  static const Color beige = Color(0xFFF3F0FF);
  // Fondo de tarjetas (antes crema) -> blanco lavanda
  static const Color crema = Color(0xFFFAF8FF);

  // Color de acento extra: cian, para detalles tipo neón
  static const Color cian = Color(0xFF06B6D4);

  // Gradiente para el fondo del Home (violeta -> índigo -> cian)
  static const RadialGradient fondoGradiente = RadialGradient(
    center: Alignment.center,
    radius: 1.1,
    colors: [
      Color(0xFF7C3AED), // violeta
      Color(0xFF4C1D95), // índigo profundo
      Color(0xFF06B6D4), // cian
    ],
    stops: [0.0, 0.6, 1.0],
  );
}
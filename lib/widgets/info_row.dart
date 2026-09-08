import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

// Widget reutilizable: una fila con ícono + texto,
// usado para mostrar datos como ubicación, correo, hobbie, etc.
class InfoRow extends StatelessWidget {
  final IconData icono;
  final String texto;

  const InfoRow({
    super.key,
    required this.icono,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icono, color: AppColors.terracota),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            texto,
            style: GoogleFonts.poppins(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
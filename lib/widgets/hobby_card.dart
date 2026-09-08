import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../models/hobby.dart';

// Widget reutilizable que representa la tarjeta de un hobby
// dentro del GridView. Recibe el hobby y una función a ejecutar
// cuando se toca el botón de favorito.
class HobbyCard extends StatelessWidget {
  final Hobby hobby;
  final VoidCallback onFavoritoTap;

  const HobbyCard({
    super.key,
    required this.hobby,
    required this.onFavoritoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.crema,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  hobby.icono,
                  size: 40,
                  color: AppColors.terracota,
                ),
                const SizedBox(height: 8),
                Text(
                  hobby.nombre,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: Icon(
                hobby.favorito ? Icons.favorite : Icons.favorite_border,
                color: AppColors.terracotaOscuro,
              ),
              onPressed: onFavoritoTap,
            ),
          ),
        ],
      ),
    );
  }
}
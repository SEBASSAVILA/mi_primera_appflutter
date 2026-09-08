import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../providers/favoritos_provider.dart';

class HobbiesScreen extends StatelessWidget {
  const HobbiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Hobbies',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.terracota,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.beige,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Consumer "escucha" al FavoritosProvider y reconstruye
        // este widget cada vez que se llama a notifyListeners()
        child: Consumer<FavoritosProvider>(
          builder: (context, favoritosProvider, child) {
            final hobbies = favoritosProvider.hobbies;

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemCount: hobbies.length,
              itemBuilder: (context, index) {
                final hobby = hobbies[index];
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
                          onPressed: () {
                            // Llamamos al método del Provider, que
                            // internamente notifica a todos los que escuchan
                            favoritosProvider.toggleFavorito(index);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  hobby.favorito
                                      ? '${hobby.nombre} agregado a favoritos'
                                      : '${hobby.nombre} quitado de favoritos',
                                ),
                                duration: const Duration(seconds: 1),
                                backgroundColor: AppColors.terracota,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
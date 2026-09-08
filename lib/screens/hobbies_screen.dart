import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../providers/favoritos_provider.dart';
import '../widgets/hobby_card.dart';

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
                return HobbyCard(
                  hobby: hobby,
                  onFavoritoTap: () {
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
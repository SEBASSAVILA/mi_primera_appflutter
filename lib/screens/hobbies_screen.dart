import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class HobbiesScreen extends StatefulWidget {
  const HobbiesScreen({super.key});

  @override
  State<HobbiesScreen> createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  // Lista de hobbies con su estado de favorito
  final List<Map<String, dynamic>> hobbies = [
    {'nombre': 'Batería', 'icono': Icons.music_note, 'favorito': true},
    {'nombre': 'Composición', 'icono': Icons.piano, 'favorito': false},
    {'nombre': 'Programación', 'icono': Icons.code, 'favorito': true},
    {'nombre': 'Videojuegos', 'icono': Icons.sports_esports, 'favorito': false},
    {'nombre': 'Lectura', 'icono': Icons.menu_book, 'favorito': false},
    {'nombre': 'Fotografía', 'icono': Icons.camera_alt, 'favorito': false},
  ];

  // Cambia el estado de favorito de un hobby (setState)
  void _toggleFavorito(int index) {
    setState(() {
      hobbies[index]['favorito'] = !hobbies[index]['favorito'];
    });

    // Interacción extra: SnackBar mostrando el cambio
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          hobbies[index]['favorito']
              ? '${hobbies[index]['nombre']} agregado a favoritos'
              : '${hobbies[index]['nombre']} quitado de favoritos',
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.terracota,
      ),
    );
  }

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
        child: GridView.builder(
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
                          hobby['icono'],
                          size: 40,
                          color: AppColors.terracota,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          hobby['nombre'],
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
                        hobby['favorito'] ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.terracotaOscuro,
                      ),
                      onPressed: () => _toggleFavorito(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
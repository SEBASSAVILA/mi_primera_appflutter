import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ProyectosScreen extends StatelessWidget {
  const ProyectosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de proyectos (datos de ejemplo)
    final List<Map<String, String>> proyectos = [
      {
        'titulo': 'Mi Primera App Flutter',
        'descripcion': 'Perfil personal desarrollado en Flutter, con paquete google_fonts.',
        'icono': 'flutter_dash',
      },
      {
        'titulo': 'Proyecto de Base de Datos',
        'descripcion': 'Modelo relacional para sistema de gestión académica.',
        'icono': 'storage',
      },
      {
        'titulo': 'Landing Page Responsive',
        'descripcion': 'Sitio web adaptable desarrollado con HTML y CSS.',
        'icono': 'web',
      },
      {
        'titulo': 'App de Música',
        'descripcion': 'Prototipo de reproductor musical, tema batería y composición.',
        'icono': 'music_note',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Proyectos',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.terracota,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.beige,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: proyectos.length,
        itemBuilder: (context, index) {
          final proyecto = proyectos[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: AppColors.crema,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                backgroundColor: AppColors.terracota,
                child: Icon(
                  _obtenerIcono(proyecto['icono']!),
                  color: Colors.white,
                ),
              ),
              title: Text(
                proyecto['titulo']!,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  proyecto['descripcion']!,
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _obtenerIcono(String nombre) {
    switch (nombre) {
      case 'flutter_dash':
        return Icons.flutter_dash;
      case 'storage':
        return Icons.storage;
      case 'web':
        return Icons.web;
      case 'music_note':
        return Icons.music_note;
      default:
        return Icons.star;
    }
  }
}
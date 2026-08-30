import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';

class ContactoScreen extends StatelessWidget {
  const ContactoScreen({super.key});

  // Abre el gestor de correo con un destinatario predefinido
  Future<void> _enviarCorreo(BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 's.avila@ecotec.edu.ec',
      query: 'subject=Contacto desde la app',
    );
    await _abrirUrl(context, emailUri);
  }

  // Abre WhatsApp con un número predefinido
  Future<void> _abrirWhatsapp(BuildContext context) async {
    final Uri whatsappUri = Uri.parse('https://wa.me/593999999999');
    await _abrirUrl(context, whatsappUri);
  }

  // Abre la ubicación en Google Maps
  Future<void> _abrirMapa(BuildContext context) async {
    final Uri mapaUri = Uri.parse('https://maps.google.com/?q=Quito,Ecuador');
    await _abrirUrl(context, mapaUri);
  }

  // Función genérica para lanzar cualquier URL, con manejo de error
  Future<void> _abrirUrl(BuildContext context, Uri url) async {
    try {
      final bool lanzado = await launchUrl(url, mode: LaunchMode.externalApplication);
      if (!lanzado && context.mounted) {
        _mostrarError(context);
      }
    } catch (e) {
      if (context.mounted) _mostrarError(context);
    }
  }

  void _mostrarError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('No se pudo abrir'),
        content: const Text('No se encontró una aplicación para completar esta acción.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacto',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.terracota,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AppColors.beige,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              '¿Quieres contactarme?',
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _botonContacto(
              context: context,
              icono: Icons.email,
              texto: 'Enviar correo',
              onTap: () => _enviarCorreo(context),
            ),
            const SizedBox(height: 14),
            _botonContacto(
              context: context,
              icono: Icons.chat,
              texto: 'Escribir por WhatsApp',
              onTap: () => _abrirWhatsapp(context),
            ),
            const SizedBox(height: 14),
            _botonContacto(
              context: context,
              icono: Icons.location_on,
              texto: 'Ver ubicación en el mapa',
              onTap: () => _abrirMapa(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _botonContacto({
    required BuildContext context,
    required IconData icono,
    required String texto,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icono),
        label: Text(texto, style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.terracota,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
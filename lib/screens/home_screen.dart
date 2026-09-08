import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/favoritos_provider.dart';
import '../widgets/info_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool mostrarInfo = false;

  void _toggleInfo() {
    setState(() {
      mostrarInfo = !mostrarInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi Perfil Personal',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color.fromARGB(255, 193, 60, 60),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Color.fromARGB(255, 150, 99, 121),
              Color(0xFF444FC7),
              Color(0xFF94BBE9),
            ],
            stops: [0.0, 0.83, 1.0],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Color.fromARGB(235, 212, 74, 64),
                  backgroundImage: AssetImage('assets/images/perfil.png'),
                ),
                const SizedBox(height: 16),
                Text(
                  'SEBASTIAN AVILA',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Estudiante de Carrera de Ingeniería en Sistemas Inteligentes',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  color: AppColors.crema,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const InfoRow(icono: Icons.location_on, texto: 'Quito, Ecuador'),
                        const SizedBox(height: 8),
                        const InfoRow(icono: Icons.email, texto: 's.avila@ecotec.edu.ec'),
                        const SizedBox(height: 8),
                        const InfoRow(
                          icono: Icons.favorite,
                          texto: 'Hobbie: Músico, Baterista, Compositor',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (mostrarInfo)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
                    ),
                    child: Text(
                      'Me apasiona la programación. '
                      'En mis tiempos libres disfruto de tocar la batería y componer música. '
                      'También me gusta aprender sobre nuevas tecnologías y cómo aplicarlas '
                      'en proyectos innovadores.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _toggleInfo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.terracotaOscuro,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    mostrarInfo ? 'Ocultar información' : 'Ver más sobre mí',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 30),
                Consumer<FavoritosProvider>(
                  builder: (context, favoritosProvider, child) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.favorite, color: AppColors.terracotaOscuro, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            '${favoritosProvider.cantidadFavoritos} hobbies favoritos',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: AppColors.terracotaOscuro,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      _botonNav(context, 'Proyectos', Icons.work, '/proyectos'),
                      _botonNav(context, 'Hobbies', Icons.favorite, '/hobbies'),
                      _botonNav(context, 'Contacto', Icons.contact_mail, '/contacto'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _botonNav(BuildContext context, String texto, IconData icono, String ruta) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pushNamed(context, ruta),
      icon: Icon(icono, size: 18),
      label: Text(texto, style: GoogleFonts.poppins(fontSize: 13)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withValues(alpha: 0.9),
        foregroundColor: AppColors.terracotaOscuro,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
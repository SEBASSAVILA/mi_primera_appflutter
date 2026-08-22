import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// Paleta de colores personalizada
const Color colorTerracota = Color(0xFFC1603C);
const Color colorTerracotaOscuro = Color(0xFF8C4530);
const Color colorBeige = Color(0xFFF5EBE0);
const Color colorCrema = Color(0xFFFFF8F0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: colorTerracota,
        scaffoldBackgroundColor: colorBeige,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PerfilScreen(),
    );
  }
}

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
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
        backgroundColor: colorTerracota,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: colorBeige,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundColor: colorTerracota,
                backgroundImage: const AssetImage('assets/images/perfil.png'),
              ),
              const SizedBox(height: 16),
              Text(
                'SEBASTIAN AVILA',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorTerracotaOscuro,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Estudiante de Carrera de Ingeniería en Sistemas Inteligentes',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 15, color: Colors.brown[400]),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                color: colorCrema,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on, color: colorTerracota),
                          const SizedBox(width: 8),
                          Text('Quito, Ecuador', style: GoogleFonts.poppins()),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email, color: colorTerracota),
                          const SizedBox(width: 8),
                          Text('s.avila@ecotec.edu.ec', style: GoogleFonts.poppins()),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.favorite, color: colorTerracota),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              'Hobbie: Músico, Baterista, Compositor',
                              style: GoogleFonts.poppins(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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
                    color: colorTerracota.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: colorTerracota.withValues(alpha: 0.4)),
                  ),
                  child: Text(
                    'Me apasiona la programación y el desarrollo de aplicaciones móviles.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(color: colorTerracotaOscuro),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleInfo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorTerracota,
                  foregroundColor: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}
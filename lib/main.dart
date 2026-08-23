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
        // NOTA: ya no usamos scaffoldBackgroundColor porque el fondo
        // ahora lo pinta el gradiente del Container en el body.
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
        backgroundColor: const Color.fromARGB(255, 193, 60, 60),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      // CAMBIO 1: quitamos "backgroundColor: colorBeige," de aquí.
      // Ahora el fondo lo pone el Container con gradiente de abajo.
      body: Container(
        // CAMBIO 2: envolvemos todo el body en un Container con
        // BoxDecoration -> gradient, que es el equivalente en Flutter
        // al "background: radial-gradient(...)" que usaste en CSS.
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              Color.fromARGB(255, 150, 99, 121), // rosa   (0% - rgba(247,89,158,1))
              Color(0xFF444FC7), // morado (83% - rgba(68,79,199,1))
              Color(0xFF94BBE9), // celeste (100% - rgba(148,187,233,1))
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
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(235, 212, 74, 64),
                  backgroundImage: const AssetImage('assets/images/perfil.png'),
                ),
                const SizedBox(height: 16),
                Text(
                  'SEBASTIAN AVILA',
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    // CAMBIO 3: el nombre pasa a blanco para que se lea
                    // bien sobre el fondo del gradiente (antes era un
                    // color oscuro, pensado para el fondo beige).
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
                      // CAMBIO 4: también en blanco (con algo de
                      // transparencia) para que contraste con el fondo.
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
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
                      // CAMBIO 5: este recuadro ahora usa blanco
                      // translúcido en vez de terracota translúcido,
                      // para que combine con el nuevo fondo.
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
                    foregroundColor: colorTerracotaOscuro,
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
      ),
    );
  }
}
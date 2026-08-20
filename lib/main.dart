import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
  title: 'Mi Perfil',
  debugShowCheckedModeBanner: false,   // borramos el banner de debug
  theme: ThemeData(
    primarySwatch: Colors.deepPurple,
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
        title: const Text('Mi Perfil Personal'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'SEBASTIAN AVILA',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Estudiante de Carrera de Ingeniería en Sistemas Inteligentes',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, color: Colors.deepPurple),
                        SizedBox(width: 8),
                        Text('Quito, Ecuador'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.email, color: Colors.deepPurple),
                        SizedBox(width: 8),
                        Text('correo@ejemplo.com'),
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Me apasiona la programación y el desarrollo de aplicaciones móviles.',
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleInfo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(mostrarInfo ? 'Ocultar información' : 'Ver más sobre mí'),
            ),
          ],
        ),
      ),
    );
  }
}
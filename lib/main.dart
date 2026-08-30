import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/proyectos_screen.dart';
import 'screens/hobbies_screen.dart';
import 'screens/contacto_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Perfil',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/proyectos': (context) => const ProyectosScreen(),
        '/hobbies': (context) => const HobbiesScreen(),
        '/contacto': (context) => const ContactoScreen(),
      },
    );
  }
}
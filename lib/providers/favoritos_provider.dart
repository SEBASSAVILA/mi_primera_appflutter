import 'package:flutter/material.dart';
import '../models/hobby.dart';

// Provider que administra la lista de hobbies y sus favoritos
class FavoritosProvider extends ChangeNotifier {
  // Lista de hobbies (antes estaba dentro de HobbiesScreen)
  final List<Hobby> hobbies = [
    Hobby(nombre: 'Batería', icono: Icons.music_note, favorito: true),
    Hobby(nombre: 'Composición', icono: Icons.piano, favorito: false),
    Hobby(nombre: 'Programación', icono: Icons.code, favorito: true),
    Hobby(nombre: 'Videojuegos', icono: Icons.sports_esports, favorito: false),
    Hobby(nombre: 'Lectura', icono: Icons.menu_book, favorito: false),
    Hobby(nombre: 'Fotografía', icono: Icons.camera_alt, favorito: false),
  ];

  // Devuelve solo los hobbies marcados como favoritos
  List<Hobby> get favoritos => hobbies.where((h) => h.favorito).toList();

  // Devuelve la cantidad de favoritos (útil para mostrar en el Home)
  int get cantidadFavoritos => favoritos.length;

  // Cambia el estado de favorito de un hobby y notifica a quien esté escuchando
  void toggleFavorito(int index) {
    hobbies[index].favorito = !hobbies[index].favorito;
    notifyListeners(); // <- esto avisa a TODAS las pantallas que usan este Provider
  }
}
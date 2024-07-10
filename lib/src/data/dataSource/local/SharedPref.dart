import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //almacenar
  Future<void> save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value) ); //key 'Usuario' , valor sera la data q trae
  }

  //metodo para leer la informacion
  Future<dynamic> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) == null) return null;
    return json.decode(prefs.getString(key)!);
  }

  //metodo para eliminar
  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  //para permitir saber si existe un objeto dentro de sesion (saber si se inicio sesion)
  Future<bool> contains(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_first_app/character_model.dart';
import 'package:my_first_app/product_model.dart';

class CharacterProvider with ChangeNotifier {
  List<Character> characters = [];
  bool isLoading = false;
  Future<void> fetchCharacter() async {
      isLoading = true;
      notifyListeners();
      final url = Uri.parse('https://api.sampleapis.com/avatar/characters');
      try{
      final response = await http.get(url);
      if (response.statusCode == 200) {
       final List<dynamic> jsonResponse = json.decode(response.body);
      characters = jsonResponse.map((json) => Character.fromJson(json)).toList();
      }
      } catch (e) {
      print('Error fetching characters: $e');
    }
    isLoading = false;
    notifyListeners();
  }
}
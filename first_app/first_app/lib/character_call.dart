import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_first_app/character_model.dart';
import 'package:my_first_app/product_model.dart';

Future<List<Character>> fetchCharater() async {
  var url = Uri.parse('https://api.sampleapis.com/avatar/characters');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    
    return jsonResponse.map((json) => Character.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
}
}
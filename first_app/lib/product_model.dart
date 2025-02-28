import 'package:flutter/material.dart';

class Products {
  int? id;
  String title;
  String? description;
  String? thumbnail;
  double? price;

  Products({
    required this.id,
    required this.title,
    required this.description,
    this.thumbnail,
    this.price,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'] as int?,
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      price: json['price'] as double?,
    );
  }
}

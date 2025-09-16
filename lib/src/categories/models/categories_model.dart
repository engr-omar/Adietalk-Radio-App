import 'package:flutter/material.dart';

class Categories {
  final String title;
  final int id;
  final String? imageUrl; // optional
  final IconData? icon; // optional

  Categories({required this.title, required this.id, this.imageUrl, this.icon});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    title: json["title"],
    id: json["id"],
    imageUrl: json["imageUrl"],
    icon: null, // icons won’t come from JSON
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
    "imageUrl": imageUrl,
  };
}

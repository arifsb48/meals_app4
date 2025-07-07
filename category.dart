import 'package:flutter/material.dart';

class Category {
  Category({required this.id, required this.title, this.color = Colors.purple});

  final dynamic id;
  final String title;
  final Color color;
}

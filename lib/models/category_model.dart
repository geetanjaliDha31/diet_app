import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: "Salad",
        iconPath: "/icons/salad.png",
        boxColor: const Color.fromARGB(255, 151, 174, 204)));

    categories.add(CategoryModel(
        name: "Cake",
        iconPath: "/icons/pancakes.png",
        boxColor: const Color.fromARGB(255, 246, 180, 233)));

    categories.add(CategoryModel(
        name: "Pie",
        iconPath: "/icons/pie.png",
        boxColor: const Color.fromARGB(255, 151, 174, 204)));

    categories.add(CategoryModel(
        name: "Smoothie",
        iconPath: "/icons/smoothie.png",
        boxColor: const Color.fromARGB(255, 246, 180, 233)));

    return categories;
  }
}

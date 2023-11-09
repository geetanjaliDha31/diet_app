import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelecetd;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelecetd,
    required this.boxColor,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
      name: "Honey Pancake",
      iconPath: "/icons/honey-pancakes.svg",
      level: "Easy",
      duration: "30mins",
      calorie: "180kCal",
      viewIsSelecetd: true,
      boxColor: const Color.fromARGB(255, 151, 174, 204),
    ));

    diets.add(DietModel(
        name: "Canai Bread",
        iconPath: "/icons/canai-bread.svg",
        level: "Easy",
        duration: "20mins",
        calorie: "230kCal",
        viewIsSelecetd: false,
        boxColor: const Color.fromARGB(255, 246, 180, 233)));
    return diets;
  }
}

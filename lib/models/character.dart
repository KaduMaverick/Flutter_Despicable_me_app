import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

List characters = [
  Character(
      name: "MIDORIYA IZUKU",
      imagePath: "assets/images/Kevin_minions.png",
      description:
          "Izuku Midoriya (緑みどり谷や出いず久く Midoriya Izuku?), also known as Deku (デク?), is the primary protagonist of the My Hero Academia manga and anime series. Though born without a Quirk, Izuku manages to catch the attention of the legendary hero All Might due to his innate heroism and has since become his close pupil as well as a student in Class 1-A at U.A. High School. All Might passed on his Quirk to Izuku, making him the ninth holder of One For All.",
      colors: [ Color(0xFF00E676), Color(0xFF43A047),]),
  Character(
      name: "KATSUKI BAKUGO",
      imagePath: "assets/images/Bakugou.png",
      description:
          "Katsuki Bakugo (爆ばく豪ごう勝かつ己き Bakugō Katsuki?), also known as Kacchan (かっちゃん?) by his childhood friends,[2] is a student in Class 1-A at U.A. High School, training to become a Pro Hero. He is the deuteragonist of the series.",
      colors: [ Color(0xFFFF8A65), Color(0xFFFF3D00)]),
];

import 'package:course_material_app/data/questions.dart';
import 'package:course_material_app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final categories = <Category>[
  Category(
    questions: questions,
    categoryName: 'Geology',
    imageUrl: 'assets/images/geology.png',
    backgroundColor: Colors.blue,
    icon: FontAwesomeIcons.rocket,
    description: 'Practice questions from various chapters in Geology',
  ),
  Category(
    questions: questions,
    imageUrl: 'assets/images/computer.jpg',
    categoryName: 'Computer Science',
    backgroundColor: Colors.orange,
    icon: FontAwesomeIcons.atom,
    description: 'Practice questions from various chapters in Computer',
  ),
  Category(
    questions: questions,
    imageUrl: 'assets/images/logo.jpg',
    categoryName: 'Statistics',
    backgroundColor: Colors.purple,
    icon: FontAwesomeIcons.squareRootAlt,
    description: 'Practice questions from various chapters in Statistics',
  ),
  Category(
    questions: questions,
    imageUrl: 'assets/images/logos.png',
    categoryName: 'Hospitality Management',
    backgroundColor: Colors.lightBlue,
    icon: FontAwesomeIcons.dna,
    description: 'Practice questions from various course in Hospitality Mgmt',
  ),
];

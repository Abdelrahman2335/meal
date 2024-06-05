import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'content.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title, required this.meals,});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(meals: meals,)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(meals: meals,),
          );
  }
}

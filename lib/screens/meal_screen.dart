import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'content.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,  this.title, required this.meals, required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(meals: meals, onToggleFavorite: onToggleFavorite,)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(meals: meals, onToggleFavorite: onToggleFavorite,),
          );
  }
}

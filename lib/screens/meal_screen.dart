import 'package:flutter/material.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        /// Note that we here didn't use [] with children because it's List of widget,
        /// so by mapping on meals and return Text (widget) then convert it to list we will give children what he want,
        /// so the code will run normally
        // children: meals.map((e) {
        //   return Text(e.title,style: TextStyle(color: Colors.red),);
        // }).toList(),
        children: meals
            .map((element) => MealItem(
                  meal: element,
                  onSelectMeal: (Meal meal) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MealDetailScreen(meal: meal,)));
                  },
                ))
            .toList(),
      ),
    );
  }
}

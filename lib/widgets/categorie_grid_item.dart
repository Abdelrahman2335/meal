import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meal_screen.dart';

class CategorieGridItem extends StatelessWidget {
  const CategorieGridItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        /// like GestureDetector but InkWell have Visual effect
        onTap: () {
         final List<Meal> filterMeal = dummyMeals.where((element) => element.categories.contains(category.id)).toList();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) =>  MealsScreen(
                title: category.title,
                meals: filterMeal,
              ),
            ),
          );
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),

        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(
                0.54,
              ),
              category.color.withOpacity(
                0.9,
              ),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
    );
  }
}

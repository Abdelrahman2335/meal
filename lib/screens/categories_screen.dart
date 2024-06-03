import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/widgets/categorie_grid_item.dart';

import '../models/meal.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;


  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2 /* this is for responsiveness */),
        children: [
          for(var element in availableCategories)
            /// note that we didn't use {} in this loop because this is flutter loop not dart
          CategoriesGridItem(category: element, onToggleFavorite: onToggleFavorite,)
        ],
    );
  }
}

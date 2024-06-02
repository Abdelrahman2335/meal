import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/widgets/categorie_grid_item.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal"),
      ),

      /// GridView is like listView but there is a difference.
      /// GridView takes a required parameter witch is gridDelegate and the type of it, is SliverGridDelegate problem it's abstract class,
      /// means we can't take object from it so we have to use any class inherits from it like SliverGridDelegateWithFixedCrossAxisCount.
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2 /* this is for responsiveness */),
        children: [
          for(var element in availableCategories)
            /// note that we didn't use {} in this loop because this is flutter loop not dart
          CategorieGridItem(category: element)
        ],
      ),
    );
  }
}

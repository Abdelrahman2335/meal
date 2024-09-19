import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Provider/favorites_provider.dart';
import 'package:meal/Provider/filter_provider.dart';
import 'package:meal/Provider/nav_bar_provider.dart';
import 'package:meal/screens/meal_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

import '../models/meal.dart';
import 'categories_screen.dart';
import 'filter_screen.dart';

/// ConsumerStatefulWidget = StatefulWidget
/// ConsumerWidget = StatelessWidget
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});


  @override
  /// note we Navigate throw screens using this simple code because it's only tow screens
  Widget build(BuildContext context,WidgetRef ref) {
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    final selectedScreenIndex = ref.watch(navBarProvider);
    ///read: It's only read the provider and if there any changes happen it does not rebuild the widget,
    ///but watch it detect any changes happen in the provider and rebuild the widget
    // ref.read(mealsProvider);
    Widget activeScreen = CategorieScreen(
      availableMeals: availableMeals,
    );
    String activeScreenTitle = "Categories";
    if (selectedScreenIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoritesMealsProvider);
      activeScreen = MealsScreen(
        meals: favoriteMeal,
      );
      activeScreenTitle = "Favorite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      drawer: mainDrawer(
        onSelectedScreen: (String identifier){
          Navigator.of(context).pop();
          if (identifier == "filters") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const FilterScreen(),
              ),
            );
          }},
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navBarProvider.notifier).selectScreen,
        currentIndex: selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}

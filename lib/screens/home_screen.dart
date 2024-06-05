import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/Provider/favorites_provider.dart';
import 'package:meal/Provider/filter_provider.dart';
import 'package:meal/Provider/meals_provider.dart';
import 'package:meal/screens/meal_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

import '../models/meal.dart';
import 'categories_screen.dart';
import 'filter_screen.dart';

/// ConsumerStatefulWidget = StatefulWidget
/// ConsumerWidget = StatelessWidget
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override

  /// note we Navigate throw screens using this simple code because it's only tow screens
  Widget build(BuildContext context) {
    ///read it's only read the provider and if there any changes happen it does not rebuild the widget,
    ///but watch it detect any changes happen in the provider and rebuild the widget
    // ref.read(mealsProvider);
    final meals = ref.watch(mealsProvider);
    final Map<Filter, bool> selectedFilter = ref.watch(filtersProvider);
    final List<Meal> availableMeals = meals.where((meal) {
      if (selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      } else {
        return true;
      }
    }).toList();
    Widget activeScreen = CategorieScreen(
      availableMeals: availableMeals,
    );
    String activeScreenTitle = "Categories";
    if (_selectedScreenIndex == 1) {
      final List<Meal> favorateMeal = ref.watch(favoritesMealsProvider);
      activeScreen = MealsScreen(
        meals: favorateMeal,
      );
      activeScreenTitle = "Favorite";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      body: activeScreen,
      drawer: mainDrawer(
        onSelectedScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meal/screens/meal_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

import '../models/meal.dart';
import 'categories_screen.dart';
import 'filter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreenIndex = 0;
  final List<Meal> _favorateMeal = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void toggleFavorateMeal(Meal meal) {
    final isExist = _favorateMeal.contains(meal);
    if (isExist) {
      setState(() {
        _favorateMeal.remove(meal);
      });
      _showInfoMessage("Meal is removed");
    } else {
      setState(() {
        _favorateMeal.add(meal);
      });
      _showInfoMessage("Marked as a Favorate!");
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void _setScreen(String identifier) {
    if (identifier == "filters") {
      Navigator.of(context).pop();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override

  /// note we change the screens using this simple code because it's only tow screens
  Widget build(BuildContext context) {
    Widget activeScreen = CategorieScreen(
      onToggleFavorite: toggleFavorateMeal,
    );
    String activeScreenTitle = "Categories";
    if (_selectedScreenIndex == 1) {
      activeScreen = MealsScreen(
        meals: _favorateMeal,
        onToggleFavorite: toggleFavorateMeal,
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

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier() : super({
/// this is the initial value
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  }
  );
  void setFilters(Map<Filter, bool> chosenFilter ){
    state = chosenFilter;
  }
  void setFilter(Filter filter, bool isActive){
/// [state] is the variable that [StateNotifier] give it to me,
/// and it's Immutability, so new state object should be created with the desired changes.
    state = {...state,filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier(),
    );
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final Map<Filter, bool> selectedFilter = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (selectedFilter[Filter.glutenFree]! &&
        !meal.isGlutenFree /*this equal false*/) {
      ///GlutenFree means does not include Gluten so in the the data base it should be false
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
});
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

/// [StateNotifier] is designed to be subclassed.
/// We first need to pass an initial value to the `super` constructor, to define
/// the initial state of our object.
class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  /// what value we will pass it's [StateNotifier] type

  bool toggleFavorateMeal(Meal meal) {
/// _favorateMeal = state because both is List<Meal>
    final isExist = state.contains(meal);
    if (isExist) {
      ///we can change the value of the sate, BUT we can't use remove or add with, so here we used where to get the value we need
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal]; ///... mean spread the elements
      return true;
    }
  }
}

/// Why we are tilling the provider about the type <FavoriteMealNotifier,List<Meal>> because he have to know how he will manage the state
final favoritesMealsProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  /// we are using here [StateNotifierProvider] because it's useful in changing values
  return FavoriteMealNotifier();
});

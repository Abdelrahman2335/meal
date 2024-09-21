import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/data/dummy_data.dart';


/// this is the first and basic code in Provider,
/// here mealsProvider's value is dummyMeals.
final mealsProvider = Provider((ref) { /// Provider usually used with static values and const
  return dummyMeals;
} );
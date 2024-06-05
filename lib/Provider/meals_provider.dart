import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/data/dummy_data.dart';

final mealsProvider = Provider((ref) { /// Provider usually used with static values and const
  return dummyMeals;
} );
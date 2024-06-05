import 'package:flutter_riverpod/flutter_riverpod.dart';


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
    /// [state] is the variable that [StateNotifier] give it to me,
    /// and it's Immutability, so new state object should be created with the desired changes.
    state = chosenFilter ;
  }
  void setFilter(Filter filter, bool isActive){
/// [state] is the variable that [StateNotifier] give it to me,
/// and it's Immutability, so new state object should be created with the desired changes.
    state = {...state,filter: isActive};
  }
}

  final filtersProvider = StateNotifierProvider<FilterNotifier,Map<Filter, bool>> ((ref) {
    return FilterNotifier();
  } );
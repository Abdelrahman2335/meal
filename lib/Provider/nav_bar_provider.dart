import 'package:flutter_riverpod/flutter_riverpod.dart';


class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(0);

  void selectScreen(int index) {
    state = index;
  }
}

final navBarProvider =
    StateNotifierProvider<NavBarNotifier, int>((_) => NavBarNotifier());

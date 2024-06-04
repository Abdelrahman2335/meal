import 'package:flutter/material.dart';
import 'package:meal/screens/home_screen.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;
  bool _lactoseFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      drawer: mainDrawer(
        onSelectedScreen: (identifier) {
          if (identifier == "meal") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const HomeScreen()),
            );
          } else {
            Navigator.pop(context);
          }
        },
      ),
      body: Column(
        children: [
          customSwitch(
            context,
            "Gluten-free",
            "Only include gluten-free meals.",
            _glutenFreeFilter,
            (bool value) => setState(() {
              _glutenFreeFilter = value;
            }),
          ),
          customSwitch(
            context,
            "Lactose-free",
            "Only include lactose-free meals.",
            _lactoseFreeFilter,
            (bool value) => setState(() {
              _lactoseFreeFilter = value;
            }),
          ),
          customSwitch(
            context,
            "Vegan",
            "Only include vegan meals.",
            _veganFilter,
            (bool value) => setState(() {
              _veganFilter = value;
            }),
          ),
          customSwitch(
            context,
            "Vegetarian",
            "Only include vegetarian meals.",
            _vegetarianFilter,
            (bool value) => setState(() {
              _vegetarianFilter = value;
            }),
          ),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    Function(bool newValue) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      value: filter,

      onChanged: onChanged,

      /// Important note we can't change the value here because there is too many so we HAVE to create a function for each switch
      //     (bool value) {
      //   setState(() {
      //     filter = value;
      //   });
      // },
    );
  }
}

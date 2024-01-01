import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Row(children: [
            Icon(
              Icons.fastfood,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              "Cooking Now!",
              style: TextStyle(fontSize: 18, color: Colors.white),
            )
          ]),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text('Meal',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24)),
          onTap: () {
            onSelectScreen('meals');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.filter_list,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text('Filter',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24)),
          onTap: () {
            onSelectScreen('filter');
          },
        ),
      ]),
    );
  }
}

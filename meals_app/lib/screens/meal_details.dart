import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [
        IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: Icon(Icons.star))
      ]),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(meal.imageUrl),
          const SizedBox(
            height: 14,
          ),
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          for (final ingredients in meal.ingredients)
            Text(
              ingredients,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          //
          const SizedBox(
            height: 14,
          ),
          Text(
            'Steps',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          for (final ingredients in meal.steps)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                ingredients,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
        ]),
      ),
    );
  }
}

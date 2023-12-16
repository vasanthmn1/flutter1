import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          MealDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite),
    ));
  }

  Widget _buildBody(BuildContext context, Meal meal) {
    return MealItem(
      meal: meal,
      onSelectMeal: (context, meal) => selectMeal(context, meal),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return const Center(
        child: Text("No Meals"),
      );
    }

    if (title == null) {
      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return _buildBody(context, meals[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return _buildBody(context, meals[index]);
        },
      ),
    );
  }
}
    // Widget context = ListView.builder(
    //   itemCount: meals.length,
    //   itemBuilder: (context, index) {
    //     return Text(meals[index].title);
    //   },
    // );
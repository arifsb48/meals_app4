import 'package:flutter/material.dart';
import 'package:meals_app4/models/meal.dart';
import 'package:meals_app4/screens/meals.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,

    required this.label,
    required this.onSelectMeal,
    required this.iconData,
    required this.controller,
    required this.meal,
    required this.title,
  });

  final void Function(BuildContext, Meal) onSelectMeal;
  final String label;
  final IconData iconData;
  final dynamic controller;
  final Meal meal;
  final String title;

  void maelambong(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => MealsScreeen(
                title: title,
                onSelectMeal: onSelectMeal,
                meal: meal,
                meals: [],
                iconData: iconData,
                label: label,
                controller: controller,
              ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              meal.imageUrl,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Ingridients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            ...meal.ingredients.map(
              (ingredient) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ...meal.steps.map(
              (steps) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Text(
                  steps,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

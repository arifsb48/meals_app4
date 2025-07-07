import 'package:flutter/material.dart';
import 'package:meals_app4/data/dummy_data.dart';
import 'package:meals_app4/models/meal.dart';
import 'package:meals_app4/screens/meal_details_screen.dart';
import 'package:meals_app4/screens/categories.dart';

class MealsScreeen extends StatelessWidget {
  const MealsScreeen({
    super.key,
    required this.title,
    required this.meal,
    required this.onSelectMeal,
    required this.label,
    required this.iconData,
    required this.controller,
    required this.meals,
  });
  final String title;
  final Meal meal;
  final void Function(BuildContext, Meal) onSelectMeal;
  final List<Meal> meals;
  final String label;
  final IconData iconData;
  final ScrollController controller;

  void cancelo(BuildContext context, Meal meals) {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => CategoriesScreen(
                title: meal.title,
                onSelectMeal: onSelectMeal,
                meals: dummyMeals,
                iconData: iconData,
                meal: [],
                controller: controller,
              ),
        ),
      );
    });
  }

  // void selectMeal(BuildContext context, Meal meal) {
  //  Navigator.of(context).push(
  //    MaterialPageRoute(
  //     builder:
  //         (context) => MealDetailsScreen(
  //           title: meal.title,
  //      meal: meal,
  //           label: label,
  //          onSelectMeal: onSelectMeal,
  //          iconData: iconData,
  //      controller: controller,
  //        ),
  //  ),
  // );
  // }

  @override
  Widget build(BuildContext context) {
    // else {
    // Show the list of meals
    //   content = Expanded(
    //   child: ListView.builder(
    //    itemCount: meals.length,
    //    itemBuilder:
    //      (context, index) => MealItem(
    //         meals: meal,
    //         title: meal.title,
    //         meal: meals[index],
    //         iconData: iconData,
    //        label: label,
    //          controller: controller,
    //        onSelectMeal: onSelectMeal,

    //   }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:
          meal.imageUrl.isEmpty
              ? // ListView.builder(
              // controller: controller,
              //  itemCount: meals.duration,
              //  itemBuilder: (ctx, index) {
              //  final meal = meals;
              //   return MealDetailsScreen(
              //    meal: meal,
              //     label: meal.title,
              //     iconData: Icons.restaurant,
              //     onSelectMeal: onSelectMeal,
              //     title: meal.title,
              //      controller: controller,
              //    );
              //  },
              //Scaffold(
              // appBar: AppBar(title: Text(meal.title)),
              // body:
              //  meal.imageUrl.isEmpty
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Uh oh ... nothing here!',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Try selecting a different category!',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              )
              : MealDetailsScreen(
                title: meal.title,
                meal: meal,
                onSelectMeal: onSelectMeal,
                label: label,
                iconData: iconData,
                controller: controller,
              ),
    );
  }
}

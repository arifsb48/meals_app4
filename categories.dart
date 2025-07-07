import 'package:flutter/material.dart';
import 'package:meals_app4/data/dummy_data.dart';
import 'package:meals_app4/models/meal.dart';
import 'package:meals_app4/widgets/category_grid_item.dart';
import 'package:meals_app4/models/category.dart';
import 'package:meals_app4/widgets/meal_item.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
    super.key,
    required this.onSelectMeal,
    required this.title,
    required this.meal,
    required this.iconData,
    required this.meals,

    required this.controller,
  });

  final String title;
  final List<Meal> meal;
  final List<Meal> meals;
  final IconData iconData;
  final void Function(BuildContext, Meal meal) onSelectMeal;

  final ScrollController controller;

  final pageKey = UniqueKey();

  void selectCategory(BuildContext context, Category category) {
    List<Meal> filterdMeals =
        dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    // List<Meal> allMeals =
    //     meal.where((meal) => meal.categories.from(category.id)).toList();
    // List<Meal> kokaiList = [];
    // kokaiList.addAll(dummyMeals);
    //void uhuks(BuildContext context, Meal meal) {
    // Meal filtered1 = meal;
    //   final Meal filtered2 = category.id;

    //final allMeals = dummyMeals;
    //  allMeals.addAll(allMeals);
    //  allMeals.addAll(allMeals);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => MealItem(
              iconData: Icons.abc,
              meal: filterdMeals[0],
              meals: dummyMeals,
              //kokaiList.firstWhere((element) => meal.every(category.id)),
              label: title,
              onSelectMeal: onSelectMeal,
              title: title,
              key: key,
              controller: controller,
            ),
      ),
    );
  }

  //  void selectCategory(BuildContext context, Category category) {
  //    List<Meal> filterdMeals =
  //        dummyMeals
  //            .where((meal) => meal.categories.contains(category.id))
  //           .toList();

  //    Navigator.of(context).push(
  //  MaterialPageRoute(
  //     builder:
  //   (context) => MealItem(
  //    iconData: Icons.abc,
  //    meal: combined,
  //   label: title,
  //    onSelectMeal: onSelectMeal,
  //   title: category.title,
  //    key: key,
  //     controller: controller,
  //     ),
  // ),
  // );
  //    title: title,
  ////   meals: meals,
  //    onSelectMeal: onSelectMeal,
  //      meal: meals,
  // //      label: label,
  //         iconData: iconData,
  //   //     ),
  //   ),
  //   );
  // Navigator.push(context, meals);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Pick your category')),
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),

        //  Column(
        //    children: [
        //    Expanded(
        //      child: Padding(
        //      padding: const EdgeInsets.all(8.0),
        //      child: GridView.builder(
        //      padding: EdgeInsets.all(24),
        //      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //        crossAxisCount: 2,
        //        mainAxisSpacing: 20,
        //        crossAxisSpacing: 20,
        //        childAspectRatio: 3 / 2,
        //      ),
        //  itemCount: meals.length,
        //   itemBuilder:
        //     (ctx, index) => MealItem(
        //      meal: meals[index],
        //          title: meals[index].title,
        //         iconData: iconData,
        //         label: title,
        //           controller: controller,
        //           onSelectMeal: onSelectMeal,
        //        ),
        //    )
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}

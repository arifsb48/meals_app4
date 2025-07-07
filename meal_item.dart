import 'package:flutter/material.dart';
import 'package:meals_app4/models/meal.dart';
import 'package:meals_app4/screens/meals.dart';
import 'package:meals_app4/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,

    required this.title,
    required this.onSelectMeal,
    required this.label,
    required this.iconData,
    required this.controller,
    required this.meal,
    required this.meals,
  });

  final String title;
  final void Function(BuildContext, Meal meals) onSelectMeal;
  final IconData iconData;
  final String label;
  final dynamic controller;
  final Meal meal;
  final List<Meal> meals;

  void _mealsscroon(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => MealsScreeen(
              title: meal.title,
              onSelectMeal: onSelectMeal,
              meal: meal,
              meals: [],
              iconData: iconData,
              label: title,
              controller: controller,
            ),
      ),
    );
  }

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: Card(
        child: InkWell(
          onTap: () {
            _mealsscroon(context, meal);
          },
          child: Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.hardEdge,
            elevation: 4,
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 400,
                  width: double.infinity,
                ),

                Positioned(
                  bottom: 12,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min',
                            ),
                            SizedBox(width: 12),
                            MealItemTrait(
                              icon: Icons.work,
                              label: complexityText,
                            ),
                            SizedBox(width: 12),
                            MealItemTrait(
                              icon: Icons.attach_money,
                              label: complexityText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

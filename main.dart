import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app4/screens/categories.dart';
import 'package:meals_app4/models/meal.dart';
import 'package:meals_app4/data/dummy_data.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(163, 126, 49, 4),
    surface: const Color.fromARGB(169, 187, 34, 23),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller =
        ScrollController(); // or the correct controller type
    // Replace with actual meals if available
    final IconData icon = Icons.fastfood;
    final String title = 'Meals App';
    void onSelectMeal(BuildContext context, Meal meal) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Selected: ${meal.title}')));
    }

    return MaterialApp(
      theme: theme,
      home: // Todo ...,
          CategoriesScreen(
        meals: [],
        onSelectMeal: onSelectMeal,
        title: title,
        meal: dummyMeals,
        iconData: icon,
        controller: controller,
      ),
    );
  }
}

import 'package:deli_meal/dummy_data.dart';
import 'package:deli_meal/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String id;
  // final String title;
  // final Color color;

  // const CategoryMealsScreen(
  //   this.id,
  //   this.title,
  //   this.color,
  // );

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routArgs['id'];
    final categoryTitle = routArgs['title'];

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

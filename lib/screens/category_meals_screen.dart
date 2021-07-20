import 'package:flutter/material.dart';


import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = "";
  List<Meal> categoryMeals = [];

  var _loadedInitData = false;



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;

      final categoryId = routArgs['id'];
      categoryTitle = routArgs['title']!;

      categoryMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();

      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
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
            removeMeal: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

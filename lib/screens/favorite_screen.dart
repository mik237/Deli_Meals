import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  
  final List<Meal> _favoriteMeals;

  FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {


    return (_favoriteMeals.isEmpty)
        ? Center(
            child: Text(
              'No Favorite Meal found!',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        : Container(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                final meal = _favoriteMeals[index];
                return MealItem(
                  id: meal.id,
                  title: meal.title,
                  imageUrl: meal.imageUrl,
                  duration: meal.duration,
                  complexity: meal.complexity,
                  affordability: meal.affordability,
                  removeMeal: () {},
                );
              },
              itemCount: _favoriteMeals.length,
            ),
          );
  }
}

import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> filteredMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];


  Map<String, bool> filters = {
    '_isGlutenFree': false,
    '_isLactoseFree': false,
    '_isVegetarian': false,
    '_isVegan': false,
  };


  bool _isMealFavorite(String mealId){
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  void _toggleFavorite(String mealId){

    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  void _saveFilters(Map<String, bool> appliedFilters) {
    setState(() {
      // filters['_isGlutenFree'] = appliedFilters['_isGlutenFree']!;
      // filters['_isLactoseFree'] = appliedFilters['_isLactoseFree']!;
      // filters['_isVegetarian'] = appliedFilters['_isVegetarian']!;
      // filters['_isVegan'] = appliedFilters['_isVegan']!;

      filters = appliedFilters;

      filteredMeals = DUMMY_MEALS.where((meal) {
        if (filters['_isGlutenFree']! && !meal.isGlutenFree) return false;

        if (filters['_isLactoseFree']! && !meal.isLactoseFree) return false;

        if (filters['_isVegan']! && !meal.isVegan) return false;

        if (filters['_isVegetarian']! && !meal.isVegetarian) return false;

        return true;
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deli Meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
      home: TabsScreen(_favoriteMeals),
      routes: {
        // '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(filteredMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_saveFilters, filters),
      },
    );
  }
}

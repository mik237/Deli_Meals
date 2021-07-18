import 'package:deli_meal/widgets/list_section.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meail-detail';

  String complexityText(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "UnKnown";
    }
  }

  String affordabilityText(Affordability affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Expensive";
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${selectedMeal.title}",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6),
                    Text("${selectedMeal.duration} min"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(width: 6),
                    Text("${complexityText(selectedMeal.complexity)}"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6),
                    Text("${affordabilityText(selectedMeal.affordability)}"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListSectionWithHeader(
              header: "Ingredients",
              elements: selectedMeal.ingredients,
            ),
            SizedBox(
              height: 10,
            ),
            ListSectionWithHeader(
              header: "Steps",
              elements: selectedMeal.steps,
              listType: ListType.NumberWithDivider,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

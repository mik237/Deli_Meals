import 'package:deli_meal/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealsScreen(id, title, color);
    // }));

    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}

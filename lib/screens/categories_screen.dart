import 'package:deli_meal/widgets/category_item.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (cat) => CategoryItem(
                id: cat.id,
                title: cat.title,
                color: cat.color,
              ),
            )
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
     
    );
  }
}

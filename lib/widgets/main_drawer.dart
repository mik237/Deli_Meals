
import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';


class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          SizedBox(height: 20),
          buildListTile(
            Icons.settings,
            'Settings',
            () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

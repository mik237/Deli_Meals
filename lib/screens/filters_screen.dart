import 'package:deli_meal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final Function _saveFilters;
  final Map<String, bool> appliedFilters;

  FiltersScreen(this._saveFilters, this.appliedFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  Widget buildSwitchListTile(
      bool currentValue, String title, String subTitle, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: (newValue) => updateValue(newValue),
    );
  }

  @override
  void initState() {
    _isGlutenFree = widget.appliedFilters['_isGlutenFree']!;
    _isLactoseFree = widget.appliedFilters['_isLactoseFree']!;
    _isVegetarian = widget.appliedFilters['_isVegetarian']!;
    _isVegan = widget.appliedFilters['_isVegan']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              widget._saveFilters({
                '_isGlutenFree': _isGlutenFree,
                '_isLactoseFree': _isLactoseFree,
                '_isVegetarian': _isVegetarian,
                '_isVegan': _isVegan,
              });
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                _isGlutenFree,
                'Gluten-free',
                'Only include gluten-free meals',
                (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                _isLactoseFree,
                'Lactose-free',
                'Only include lactose-free meals',
                (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                _isVegetarian,
                'Vegetarian',
                'Only include vegetarian meals',
                (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                _isVegan,
                'Vegan',
                'Only include vegan meals',
                (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mealstogo/models/meals.dart';
import 'package:mealstogo/widgets/main_drawer.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsBottomScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsBottomScreen(this.favoriteMeals);

  @override
  _TabsBottomScreenState createState() => _TabsBottomScreenState();
}

class _TabsBottomScreenState extends State<TabsBottomScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((_pages[_selectedPageIndex]['title'] as String)),
      ),
      body: (_pages[_selectedPageIndex]['page'] as Widget),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

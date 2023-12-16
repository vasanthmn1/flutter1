import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectFilter = kInitialFilters;

  void _showInfoMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage("meal is no remove");
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage("meal is no add Favorite");
    }
  }

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePageTitle = "My Favorites";
      activePage = MealsScreen(
        title: "Favorites",
        meals: _favoriteMeals,
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
    }
    //
    void _setScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == "filter") {
        final result = await Navigator.of(context)
            .push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilter: _selectFilter),
        ));

        setState(() {
          _selectFilter = result ?? _selectFilter;
        });

        print(result);
      } else {
        // Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        selectedIconTheme: IconThemeData(color: Colors.red),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ],
      ),
    );
  }
}

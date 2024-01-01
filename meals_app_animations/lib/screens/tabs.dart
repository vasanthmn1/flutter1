import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app_animations/provider/favorite_meal_provider.dart';
import 'package:meals_app_animations/provider/filter_provider.dart';
import 'package:meals_app_animations/provider/meals_provider.dart';
import 'package:meals_app_animations/screens/categories.dart';
import 'package:meals_app_animations/screens/filters.dart';
import 'package:meals_app_animations/screens/meals.dart';
import 'package:meals_app_animations/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilter = ref.watch(filtersProvider);

    final availableMeals = ref.watch(filterMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealProvider);
      activePageTitle = "My Favorites";
      activePage = MealsScreen(
        title: "Favorites",
        meals: favoriteMeals,
        // onToggleFavorite: _toggleMealFavoriteStatus,
      );
    }
    //
    void _setScreen(String identifier) async {
      Navigator.of(context).pop();
      if (identifier == "filter") {
        await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ));
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

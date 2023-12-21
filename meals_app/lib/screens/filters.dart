import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your  Filter"),
      ),
      body: Column(children: [
        SwitchListTile(
          value: activeFilter[Filter.glutenFree]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
          },
          subtitle: Text(
            "Only meals",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          title: Text("Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          activeColor: Theme.of(context).colorScheme.tertiary,
          // contentPadding: Padding(padding: EdgeInsets.all(8)),
        ),
        SwitchListTile(
          value: activeFilter[Filter.lactoseFree]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
          },
          subtitle: Text(
            "Lactoses-free",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          title: Text("Lactoses-free meals",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          activeColor: Theme.of(context).colorScheme.tertiary,
          // contentPadding: Padding(padding: EdgeInsets.all(8)),
        ),
        SwitchListTile(
          value: activeFilter[Filter.lactoseFree]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
          },
          subtitle: Text(
            "Vegetarian",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          title: Text("Vegetarian food",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          activeColor: Theme.of(context).colorScheme.tertiary,
          // contentPadding: Padding(padding: EdgeInsets.all(8)),
        ),
        SwitchListTile(
          value: activeFilter[Filter.vegan]!,
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
          },
          subtitle: Text(
            "Vegan",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          title: Text("Vegan food",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          activeColor: Theme.of(context).colorScheme.tertiary,
          // contentPadding: Padding(padding: EdgeInsets.all(8)),
        )
      ]),
    );
  }
}
   //  body: WillPopScope(
    // onWillPop: () async {
    //   final activeFilter = ref.read(filtersProvider.notifier).setFilters({
    //     Filter.glutenFree: _glutenFreeFilterSet,
    //     Filter.lactoseFree: _lactoseFreeFilterSet,
    //     Filter.vegetarian: _vegetarianFilterSet,
    //     Filter.vegan: _veganFilterSet,
    //   });

    //   return true;
    // },

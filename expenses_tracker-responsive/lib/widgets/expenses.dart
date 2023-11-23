import 'package:expenses_tracker/widgets/chart/chart.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    Expense(
        amount: 12,
        date: DateTime.now(),
        title: 'some',
        category: Category.food),
    Expense(
        amount: 12,
        date: DateTime.now(),
        title: 'some',
        category: Category.food),
  ];

  void _openAddExpenseOverlay(ctx) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: ThemeData.dark().primaryColor,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addNewExpense,
          );
        });
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
    Navigator.pop(context);
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars(); // quick remove SnackBar
    // deleted msg
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Deleted"),
      duration: const Duration(seconds: 3),
      // undo deleted item
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registerExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expense"),
    );

    if (_registerExpenses.isNotEmpty) {
      mainContent =
          ExpensesList(expense: _registerExpenses, remove: _removeExpense);
    }
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        // toolbar topBar
        appBar: AppBar(title: const Text("Expenses Tracker"), actions: [
          IconButton(
              onPressed: () {
                _openAddExpenseOverlay(context);
              },
              icon: const Icon(Icons.add))
        ]),
        body: width < 600
            ? Column(children: [
                Chart(expenses: _registerExpenses),
                // list of expenses
                Expanded(child: mainContent)
              ])
            : Row(
                children: [
                  Expanded(
                    child: Chart(expenses: _registerExpenses),
                  ),
                  // list of expenses
                  Expanded(child: mainContent)
                ],
              ));
  }
}

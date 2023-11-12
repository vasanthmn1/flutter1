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
        amount: 12.22,
        date: DateTime.now(),
        title: "title",
        category: Category.food),
    Expense(
        amount: 30.22,
        date: DateTime.now(),
        title: "Cinema",
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay(ctx) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // toolbar topBar
      appBar: AppBar(title: const Text("Expenses Tracker"), actions: [
        IconButton(
            onPressed: () {
              _openAddExpenseOverlay(context);
            },
            icon: const Icon(Icons.add))
      ]),
      body: Column(children: [
        const Text("The Charts"),
        // list of expenses
        Expanded(child: ExpensesList(expense: _registerExpenses))
      ]),
    );
  }
}

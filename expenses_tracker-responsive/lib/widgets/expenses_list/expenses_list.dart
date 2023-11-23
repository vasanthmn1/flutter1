import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense, required this.remove});

  final List<Expense> expense;
  final void Function(Expense expense) remove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) {
          // remove expense
          return Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.50),
                margin: const EdgeInsets.all(14),
              ),
              onDismissed: (direction) {
                remove(expense[index]);
              },
              key: ValueKey(expense[index]),
              child: ExpensesItem(expense[index]));
        });
  }
}

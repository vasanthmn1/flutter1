import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expense});

  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) {
          return ExpensesItem(expense[index]);
        });
  }
}

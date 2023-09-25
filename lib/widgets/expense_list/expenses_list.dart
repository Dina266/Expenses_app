import 'package:expenses_app/widgets/expense_list/expenses_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            color: Theme.of(context).colorScheme.error.withOpacity(0.7),
          ),
          onDismissed: (direction) => onRemoveExpense(expenses[index]),
            key: ValueKey(expenses[index]),
            child: ExpensesItem(expense: expenses[index])));
  }
}

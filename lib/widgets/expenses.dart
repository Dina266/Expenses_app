import 'package:expenses_app/chart/char.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'expense_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      category: Category.work,
      title: 'Flutter course',
      amount: 29.9,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.leisure,
      title: 'Cinema',
      amount: 9.19,
      date: DateTime.now(),
    ),
    Expense(
      category: Category.food,
      title: 'Breakfast',
      amount: 31.3,
      date: DateTime.now(),
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Flutter ExpenseTracker')), actions: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (ctx) => SizedBox(
                        height: 600,
                        width: double.infinity,
                        child: NewExpense(
                          onAddExpense: _addExpense,
                        ),
                      ));
            },
            icon: const Icon(Icons.add)),
      ]),
      body: Center(
        child: Column(
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: ExpensesList(
                expenses: _registeredExpenses , 
                onRemoveExpense: _removeExpense,
                ),
            )
          ],
        ),
      ),
    );
  }
}

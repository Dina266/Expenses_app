import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  final formatter = DateFormat.yMd();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.travel;

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              Row(
                children: [
                  Text(_selectedDate == null
                      ? 'No Date Selected'
                      : formatter.format(_selectedDate!) , style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                  IconButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      final firstDate =
                          DateTime(now.year - 1, now.month, now.day);
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: firstDate,
                        lastDate: now,
                      );
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    },
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((e) => DropdownMenuItem(
                        value: e, child: Text(e.name.toUpperCase() , style: TextStyle(color: Theme.of(context).colorScheme.secondary),)))
                    .toList(),
                onChanged: (newCat) {
                  if (newCat == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = newCat;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final enteredAmount = double.tryParse(_amountController.text);
                  final amountISInvalid =
                      enteredAmount == null || enteredAmount <= 0;

                  if (_titleController.text.trim().isEmpty ||
                      amountISInvalid ||
                      _selectedDate == null) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Invalid input' ,),
                        content: const Text('Please make sure a valid title , amount , date , category was entered'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(),
                            child: const Text('Okey'),
                          )
                        ],
                      ),
                    );
                  } else {
                    widget.onAddExpense(Expense(
                    category: _selectedCategory,
                    title: _titleController.text,
                    amount: enteredAmount,
                    date: _selectedDate!,
                  ));

                  Navigator.of(context).pop();
                  }

                },
                child: const Text('Save Expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}

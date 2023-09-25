
import 'package:expenses_app/chart/char_bar.dart';
import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  get maxTotalExpense {
    double maxTotalExpense = 0;

    for (var element in buckets) {
      if (element.totalExpenses > maxTotalExpense) {
        maxTotalExpense = element.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              for (final ele in buckets)
                ChartBar(
                  fill: ele.totalExpenses == 0
                      ? 0
                      : ele.totalExpenses / maxTotalExpense,
                ),
            ],
          )),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: buckets
                .map((e) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(categoryIcons[e.category],
                          color: isDarkMode
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7)),
                    )))
                .toList()
                .cast<Widget>(),
          ),
        ],
      ),
    );
  }
}

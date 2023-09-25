import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: SizedBox(
            height: double.infinity,
            child: FractionallySizedBox(
              heightFactor: fill,
              alignment: Alignment.bottomRight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  color: isDarkMode
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.secondary.withOpacity(0.6),
                ),
              ),
            ),
          ),
          ),
    );
  }
}

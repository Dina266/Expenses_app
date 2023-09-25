import './widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));
var myDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // themeMode: ThemeMode.dark,
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: myColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: myColorScheme.onPrimaryContainer,
              foregroundColor: myColorScheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
              color: myColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myColorScheme.onSecondaryContainer,
                  fontSize: 17,
                ),
              ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          iconTheme: const IconThemeData().copyWith(
            color: myDarkColorScheme.secondary
          ),
          useMaterial3: true,
          colorScheme: myDarkColorScheme,
          bottomSheetTheme: const BottomSheetThemeData().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer
          ),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: myDarkColorScheme.onPrimaryContainer,
              foregroundColor: myDarkColorScheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
              color: myDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myDarkColorScheme.onPrimaryContainer,
                  foregroundColor: myDarkColorScheme.primaryContainer,
                  )),
                  
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myDarkColorScheme.onSecondaryContainer,
                  fontSize: 17,
                ),
              ),
        ),
        home: const Expenses());
  }
}

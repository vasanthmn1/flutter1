import 'package:expenses_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var kColorScheme =
        ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 47, 255));

    // dark

    var kDarkColorSchema =
        ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 1, 11, 56));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorSchema,
        textTheme: ThemeData().textTheme.copyWith(
            titleSmall: TextStyle(color: const Color.fromARGB(255, 255, 17, 0)),
            titleLarge: const TextStyle(fontSize: 21),
            bodySmall: TextStyle(color: const Color.fromARGB(255, 255, 17, 0))),
        cardTheme: CardTheme(
            color: kDarkColorSchema.primary, margin: const EdgeInsets.all(10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: kDarkColorSchema.primary,
                backgroundColor: kDarkColorSchema.primaryContainer)),
      ),

      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          useMaterial3: true,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: Colors.white),
          cardTheme: CardTheme(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.all(10)),
          scaffoldBackgroundColor: Colors.blueGrey,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 21),
              bodySmall:
                  TextStyle(color: const Color.fromARGB(255, 255, 17, 0)))),

      themeMode: ThemeMode.light, // deflate
      home: const Expenses(),
    );
  }
}

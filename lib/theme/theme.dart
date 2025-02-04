import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 41, 41, 41),
  dividerTheme: DividerThemeData(
    color: Colors.white10,
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    backgroundColor: const Color.fromARGB(255, 41, 41, 41),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    centerTitle: true,
  ),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white,
  ),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      labelSmall: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      )),
  useMaterial3: true,
);

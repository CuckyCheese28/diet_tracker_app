// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/diet_provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_meal_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/bmi_input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DietProvider(),
      child: MaterialApp(
        title: 'Diet Tracker',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/add_meal': (context) => AddMealScreen(),
          '/settings': (context) => SettingsScreen(),
          '/bmi_input': (context) => BMIInputScreen(),
        },
      ),
    );
  }
}

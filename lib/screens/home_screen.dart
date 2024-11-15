// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/diet_provider.dart';
import 'add_meal_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Diet Tracker"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Daily Goal: ${dietProvider.dailyGoal} cal",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Total Calories: ${dietProvider.totalCalories} cal",
                style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
            SizedBox(height: 16),
            Text(dietProvider.advice,
                style: TextStyle(fontSize: 16, color: Colors.green)),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: dietProvider.meals.length,
                itemBuilder: (context, index) {
                  final meal = dietProvider.meals[index];
                  return ListTile(
                    title: Text(meal.name),
                    subtitle: Text("${meal.calories} cal"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.pushNamed(context, '/add_meal');
      },
      tooltip: 'Log a Meal',
    ),
    SizedBox(height: 16),
    FloatingActionButton(
      child: Icon(Icons.fitness_center),
      onPressed: () {
        Navigator.pushNamed(context, '/bmi_input');
      },
      tooltip: 'Calculate BMI',
    ),
  ],
),

    );
  }
}

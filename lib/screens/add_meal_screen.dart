// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/meal.dart';
import '../providers/diet_provider.dart';

class AddMealScreen extends StatefulWidget {
  @override
  _AddMealScreenState createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final _nameController = TextEditingController();
  final _caloriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Meal")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Meal Name"),
            ),
            TextField(
              controller: _caloriesController,
              decoration: InputDecoration(labelText: "Calories"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final calories = int.tryParse(_caloriesController.text) ?? 0;
                if (name.isNotEmpty && calories > 0) {
                  final meal = Meal(name: name, calories: calories);
                  Provider.of<DietProvider>(context, listen: false).addMeal(meal);
                  Navigator.pop(context);
                }
              },
              child: Text("Add Meal"),
            ),
          ],
        ),
      ),
    );
  }
}

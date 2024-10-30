// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/diet_provider.dart';

class SettingsScreen extends StatelessWidget {
  final _goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dietProvider = Provider.of<DietProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _goalController,
              decoration: InputDecoration(
                labelText: "Daily Calorie Goal",
                hintText: dietProvider.dailyGoal.toString(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final goal = int.tryParse(_goalController.text) ?? 0;
                if (goal > 0) {
                  dietProvider.setDailyGoal(goal);
                  Navigator.pop(context);
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BMIInputScreen extends StatefulWidget {
  @override
  _BMIInputScreenState createState() => _BMIInputScreenState();
}

class _BMIInputScreenState extends State<BMIInputScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';
  String _advice = '';

  void _calculateBMI() {
    final height = double.tryParse(_heightController.text);
    final weight = double.tryParse(_weightController.text);

    if (height != null && weight != null && height > 0 && weight > 0) {
      final bmi = weight / (height * height);
      String bmiCategory = '';
      String advice = '';

      // BMI categories and advice
      if (bmi < 18.5) {
        bmiCategory = 'Underweight';
        advice = 'You should focus on a nutrient-rich diet with more calories. Include healthy fats, lean proteins, and carbohydrates.';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        bmiCategory = 'Fit';
        advice = 'Maintain a balanced diet with a mix of proteins, carbs, and healthy fats. Keep exercising regularly.';
      } else if (bmi >= 25 && bmi < 29.9) {
        bmiCategory = 'Overweight Type 1';
        advice = 'Focus on reducing portion sizes, and increase your physical activity. Avoid sugary and high-calorie foods.';
      } else if (bmi >= 30 && bmi < 34.9) {
        bmiCategory = 'Obese Type 2';
        advice = 'Consult a dietitian for a low-calorie diet plan. Include daily walks and consider joining a fitness program.';
      } else {
        bmiCategory = 'Obese Type 3';
        advice = 'Seek medical advice for a tailored weight loss plan. Focus on low-impact exercises like swimming or cycling.';
      }

      setState(() {
        _bmiResult = 'BMI: ${bmi.toStringAsFixed(2)}';
        _bmiCategory = bmiCategory;
        _advice = advice;
      });
    } else {
      setState(() {
        _bmiResult = 'Invalid input, please enter valid height and weight.';
        _bmiCategory = '';
        _advice = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height (m)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _bmiResult,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _bmiCategory,
              style: TextStyle(fontSize: 18, color: Colors.blueAccent),
            ),
            SizedBox(height: 10),
            Text(
              _advice,
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

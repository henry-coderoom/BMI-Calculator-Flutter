import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });
  final int height;
  final int weight;
  late double bmi;

  String calcBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResTitle() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpret() {
    if (bmi >= 25) {
      return 'Your BMI is too high.';
    } else if (bmi > 18) {
      return 'You\'re doing great, keep it up!';
    } else {
      return 'Try to eat more often, your BMI is too low.';
    }
  }
}

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reuse_card.dart';
import 'package:flutter/material.dart';
import 'reuse_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpret})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpret;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF07091B),
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  'Your Health',
                  style: kResultTitle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colore: kReUsableColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                        color: Color(0xFF24d876),
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    bmiResult,
                    style: kResultNum,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    interpret,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 25),
                color: const Color(0xFFeb1555),
                height: 60,
                padding: const EdgeInsets.only(bottom: 10),
                child: const Center(
                  child: Text(
                    "Re-Calculate",
                    style: kPinkCalBut,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

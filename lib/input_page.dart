import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuse_child.dart';
import 'reuse_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calcu_brain.dart';

enum Gender {
  male,
  female,
  notSelected,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender userGender = Gender.notSelected;
  int height = 180;
  int weight = 35;
  int age = 10;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF07091B),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      userGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colore: userGender == Gender.female
                        ? kReUsableColor
                        : kInactiveColor,
                    cardChild: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: ReuseChild(
                          icone: FontAwesomeIcons.venus,
                          texte: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      userGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colore: userGender == Gender.male
                        ? kReUsableColor
                        : kInactiveColor,
                    cardChild: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: ReuseChild(
                          icone: FontAwesomeIcons.mars,
                          texte: 'MALE',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colore: kReUsableColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        const Text(
                          'HEIGHT',
                          style: kTexteStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kBigNums,
                            ),
                            const SizedBox(
                              width: 3.0,
                            ),
                            const Text(
                              'cm',
                              style: kTexteStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: const Color(0xFFeb1555),
                            overlayColor: const Color(0x29eb1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 12),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 20),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 400,
                            inactiveColor: const Color(0xFF8d8e98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colore: kReUsableColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kTexteStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kBigNums,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton(
                              context,
                              FontAwesomeIcons.minus,
                              () => setState(() {
                                    weight--;
                                  })),
                          const SizedBox(
                            width: 10,
                          ),
                          buildButton(
                              context,
                              FontAwesomeIcons.plus,
                              () => setState(() {
                                    weight++;
                                  })),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colore: kReUsableColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kTexteStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBigNums,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildButton(
                              context,
                              FontAwesomeIcons.minus,
                              () => setState(() {
                                    age--;
                                  })),
                          const SizedBox(
                            width: 10,
                          ),
                          buildButton(
                              context,
                              FontAwesomeIcons.plus,
                              () => setState(() {
                                    age++;
                                  })),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: cal.calcBmi(),
                          resultText: cal.getResTitle(),
                          interpret: cal.getInterpret(),
                        )),
              );
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 25),
              color: const Color(0xFFeb1555),
              height: 60,
              padding: const EdgeInsets.only(bottom: 10),
              child: const Center(
                child: Text(
                  "Calculate",
                  style: kPinkCalBut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ElevatedButton buildButton(
    BuildContext context, IconData iconData, Function() onTap) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF4c4f5e),
        elevation: 2,
      ),
      onPressed: () {
        onTap();
      },
      child: Icon(iconData));
}

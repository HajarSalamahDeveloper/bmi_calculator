import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/screens/resultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottomButton.dart';
import '../components/reusable_card.dart';
import '../components/roundIconButton.dart';
import '../constants.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  GenderType? gender;
  int hight = 180;
  int weight = 60;
  int age = 14;
//1 = male0_0 ,,,,,, 2 =female*_-
//   void updateColour(GenderType gender) {
//     if (gender == GenderType.male) {
//       if (maleCardColour == inactiveCardColour) {
//         maleCardColour = activeColor;
//         femaleCardColour = inactiveCardColour;
//         print("we are here lady");
//       } else {
//         maleCardColour = inactiveCardColour;
//       }
//     }
//     if (gender == GenderType.female) {
//       if (femaleCardColour == inactiveCardColour) {
//         femaleCardColour = activeColor;
//         maleCardColour = inactiveCardColour;
//         print("we are here child");
//       } else {
//         femaleCardColour = inactiveCardColour;
//       }
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: gender == GenderType.male
                        ? kactiveColor
                        : kinactiveCardColour,
                    cardChild: Iconcontent(
                      textCard: "MALE",
                      iconCard: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(() {
                        gender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: gender == GenderType.female
                        ? kactiveColor
                        : kinactiveCardColour,
                    cardChild: Iconcontent(
                      textCard: "FAMALE",
                      iconCard: FontAwesomeIcons.venus,
                    ),
                    onPress: () {
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: kactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HIEGHT",
                    style: klabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hight.toString(),
                        style: kNumberCardStyle,
                      ),
                      Text(
                        "cm",
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x1fEB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                        value: hight.toDouble(),
                        max: 220,
                        min: 120,
                        onChanged: (double newValue) {
                          setState(() {
                            hight = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: kinactiveCardColour,
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: klabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberCardStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kinactiveCardColour,
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: klabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberCardStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(
              buttonTitle: 'CALCULATER',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: hight, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calculator(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}

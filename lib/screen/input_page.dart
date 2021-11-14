import 'package:bmi_calculator_pratikum_m/calculator_brain.dart';
import 'package:bmi_calculator_pratikum_m/components/bottom_button.dart';
import 'package:bmi_calculator_pratikum_m/components/round_button_icon.dart';
import 'package:bmi_calculator_pratikum_m/constant.dart';
import 'package:bmi_calculator_pratikum_m/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';

// const buttonContainerHeight = 100.0;
// const activeCardColour = Color(0xFFF1D1E33);
// const inActiveCardColour = Color(0xFFF111328);
// const buttonContainerColor = Color(0xFFFF0044);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGander;
  int height = 180;
  int weight = 30;
  int age = 18;

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
            // Ini Untuk Jenis Kelamin
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGander = Gender.male;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: selectedGander == Gender.male
                        ? kActiveCardColor
                        : kIActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGander = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FAMELE',
                    ),
                    colour: selectedGander == Gender.female
                        ? kActiveCardColor
                        : kIActiveCardColor,
                  ),
                ),
              ],
            )),

            // Ini Untuk Tinggi
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0xFF29EB155),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderThumbShape(enabledThumbRadius: 30.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Ini Untuk berat dan Umur
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundButtonIcon(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Ini Tombol Untuk Menghitung(Calculate)

            // Container(
            //   child: Row(
            //     children: [
            //       Expanded(
            //           child: ReusableCard(
            //         colour: kBottomContainerColor,
            //         // cardChild: IconContent(
            //         //   icon: FontAwesomeIcons.calculator,
            //         //   label: 'Hitung',
            //         //   sizeIcon: 30.0,
            //         // ),
            //       ))
            //     ],
            //   ),
            //   margin: EdgeInsets.only(top: 10.0),
            //   height: kBottomContainerHeight,
            //   width: double.infinity,
            //   color: kBottomContainerColor,
            // ),
            BottomButton(
                buttonText: "CALCULATE",
                onTap: () {
                  CalculatorBrain hitung =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.pushNamed(context, ResultPage.routeName,
                      arguments: ResultPage(
                        bmiResult: hitung.calculateBMI(),
                        resultText: hitung.getResult(),
                        interpretation: hitung.getInterpetation(),
                      ));
                })
          ],
        )

        // Ini Tombol Floating Button
        // floatingActionButton: Theme(
        //   // data: ThemeData(accentColor: Colors.purple.shade600),
        //   data: ThemeData(accentColor: Color(0xFF68005e)),
        //   child: FloatingActionButton(
        //     child: Icon(Icons.add),
        //     onPressed: () {},
        //   ),
        // ),
        );
  }
}

// // Ini Untuk Jenis Kelamin
            // Expanded(
            //     child: Row(
            //   children: [
            //     Expanded(child: child),
            //     Expanded(child: child),
            //   ],
            // )),
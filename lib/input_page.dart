import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int heightt = 170;

  int weightt = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardchild: IconContent(
                      myicon: FontAwesomeIcons.mars,
                      mytext: "MALE",
                    ),
                    colour: selectedGender == Gender.male
                        ? activecardcolor
                        : inactivecardcolor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardchild: IconContent(
                        myicon: FontAwesomeIcons.venus,
                        mytext: "FEMALE",
                      ),
                      colour: selectedGender == Gender.female
                          ? activecardcolor
                          : inactivecardcolor),
                )
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: activecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: LableTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        heightt.toString(),
                        style: NumberTextStyle,
                      ),
                      Text(
                        "CM",
                        style: LableTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    min: 50.0,
                    max: 300.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    value: heightt.toDouble(),
                    onChanged: (double newvalue) {
                      setState(() {
                        heightt = newvalue.round();
                      });
                    },
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: activecardcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: LableTextStyle,
                      ),
                      Text(
                        weightt.toString(),
                        style: NumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            OnPress: () {
                              setState(() {
                                weightt--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            OnPress: () {
                              setState(() {
                                weightt++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: LableTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: NumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            OnPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            OnPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  colour: activecardcolor,
                ))
              ],
            )),
            GestureDetector(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: heightt, weight: weightt);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ResultPage(
                              bmiResult: calc.CalculatorBMI(),
                          resultText: calc.Result(),
                          interpretation: calc.getInterPretetion(),
                            )));
              },
              child: Container(
                child: Center(
                    child: Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                )),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                height: 70,
                width: double.infinity,
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.OnPress});

  final IconData icon;

  final Function OnPress;
// comment
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: OnPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}

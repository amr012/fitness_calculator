import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.resultText ,@required this.interpretation});
  final String bmiResult ;
  final String resultText ;
  final String interpretation ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                  child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              )),
            ),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: activecardcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF24D876)),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 100),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);

              },
              child: Container(
                child: Center(
                    child: Text(
                      "RE-CALCULATE",
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



 import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height , this.weight});
  int height ;
  int weight ;
  double _bmi ;

 String CalculatorBMI(){
   _bmi = weight / pow(height / 100, 2) ;
  return _bmi.toStringAsFixed(1);
 }

 String Result(){
   if(_bmi >= 25){
     return "over weight";

   }else if(_bmi > 18.5){
      return"Normal";

   }else return"Under Weight";
 }

 String getInterPretetion(){
   if(_bmi >= 25){
     return "you have a higher than normal body weight , you have to exercise more.";

   }else if(_bmi > 18){
     return"yoy have a normal body weight , good job!";

   }else return"you have a lower than normal body weight , you can eat a bit more. ";
 }

 }
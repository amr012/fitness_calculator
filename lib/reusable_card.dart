


import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final cardchild;
  final onpress;

  ReusableCard({this.colour, this.cardchild,this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onpress ,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

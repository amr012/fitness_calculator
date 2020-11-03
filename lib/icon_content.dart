
import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  final IconData myicon;
  final String mytext;
  IconContent({this.myicon,this.mytext});
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(myicon,size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(mytext,style: TextStyle(fontSize: 20),)
      ],

    );
  }
}

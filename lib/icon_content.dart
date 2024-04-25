import 'package:flutter/material.dart';

class ReusableCardColumn extends StatelessWidget {

  ReusableCardColumn({required this.fontIcon,required this.genderText});

  final IconData fontIcon;
  final String genderText;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(fontIcon,size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(genderText, style: TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98),),)
      ],
    );
  }
}
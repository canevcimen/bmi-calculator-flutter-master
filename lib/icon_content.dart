import 'package:flutter/material.dart';
import 'constants.dart';
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
        Text(genderText, style: kLabelTextStyle ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({required this.onTap,required this.buttonName});

  final VoidCallback onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(buttonName, style: kButtonTextStyle),
        ),
      ),
    );
  }
}
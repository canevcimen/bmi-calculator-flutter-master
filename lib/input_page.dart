import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  //1 Male, 2 Female
  void updateColour(int gender)
  { //Male Card Pressed
    if(gender==1)
      {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      }
    else{
      maleCardColour = inactiveCardColour;
    }

    if(gender==2)
      {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      }
    else{
      femaleCardColour = inactiveCardColour;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCard(colour: maleCardColour,
                    cardChild: ReusableCardColumn(
                      genderText: 'MALE',
                      fontIcon: FontAwesomeIcons.mars
                    ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(colour: femaleCardColour,
                    cardChild: ReusableCardColumn(
                      genderText: 'FEMALE',
                      fontIcon: FontAwesomeIcons.venus,
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: activeCardColour,),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activeCardColour,),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColour,),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}



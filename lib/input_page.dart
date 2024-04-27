import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  //1 Male, 2 Female

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableCardColumn(
                        genderText: 'MALE', fontIcon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: ReusableCardColumn(
                      genderText: 'FEMALE',
                      fontIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),  // yuvarlağın rengi
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0), //yuvarlağın büyüklüğü
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0), // yuvarlağa tıklayıp sağ sol yaptığımızdaki boyutu
                      overlayColor: Color(0x29EB1555), // yuvarlağı hareket ettirince transparan içindeki renk
                      inactiveTrackColor: Color(0xFF8E8D98),
                      activeTrackColor: Colors.white, //active ve inactive slider rengini değiştirmek için kullan
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 260,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.minus,(){
                              setState(() {
                                weight--;
                              });
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(FontAwesomeIcons.plus,(){
                              setState(() {
                                weight++;
                              });
                            },),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: kLabelTextStyle,),
                        Text(age.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.minus,(){
                              setState(() {
                                age--;
                              });
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(FontAwesomeIcons.plus,(){
                              setState(() {
                                age++;
                              });
                            },),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {

  RoundIconButton(@required this.icon, @required this.onPressed);

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

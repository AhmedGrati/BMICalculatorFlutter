import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_box.dart';
import 'icon_content.dart';
import 'gender.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int heightValue = 180;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                      child: CardBox(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.mars,
                          content: 'Male',
                        )
                      ),
                ),
                Expanded(
                      child: CardBox(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.venus,
                          content: 'Female',
                        ),
                      ),
                )
              ],
            ),
          ),
          Expanded(
              child: CardBox(
              colour: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Height',
                      style: kIconContentTextStyle
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(heightValue.toString() ,
                          style: kIconContentTextStyle,
                        ),

                        Text('CM' ,
                          style:kCentimeterStyle
                        )
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    SliderTheme(
                      data:SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child:
                        Slider(
                        value: heightValue.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          setState(() {
                            heightValue = value.round();
                          });
                        },
                      ),
                    )
                  ],
              ),
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: CardBox(
                  colour: kInactiveCardColor,
                )),
                Expanded(child: CardBox(
                  colour: kInactiveCardColor,
                ))
              ],
            ),
          ),
          Container(
              height: kBottomHeight,
              decoration: BoxDecoration(
                  color: kBottomColor
              ),
            ),
        ],
      ),
    );
  }
}

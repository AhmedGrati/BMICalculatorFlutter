import 'file:///C:/Users/Ahmed/Desktop/src/Projects/bmi_calculator/lib/components/rounded_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/card_box.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../gender.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import '../components/bottom_button.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int heightValue = 180;
  int weightValue = 60;
  int ageValue = 16;
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
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Weight' ,
                        style: kIconContentTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            weightValue.toString(),
                            style: kIconContentTextStyle,
                          ),
                          Text('KG' , style: kCentimeterStyle,)
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedButton(
                            onPress: () {
                              setState(() {
                                weightValue--;
                              });
                            },
                            iconData: FontAwesomeIcons.minus,
                          ),
                          SizedBox(width: 10.0,),
                          RoundedButton(
                            onPress: () {
                              setState(() {
                                weightValue++;
                              });
                            },
                            iconData: FontAwesomeIcons.plus,
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: kInactiveCardColor,
                )),
                Expanded(child: CardBox(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Age' ,
                        style: kIconContentTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        ageValue.toString(),
                        style: kIconContentTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundedButton(
                            onPress: () {
                              setState(() {
                                ageValue--;
                              });
                            },
                            iconData: FontAwesomeIcons.minus,
                          ),
                          SizedBox(width: 10.0,),
                          RoundedButton(
                            onPress: () {
                              setState(() {
                                ageValue++;
                              });
                            },
                            iconData: FontAwesomeIcons.plus,
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: kInactiveCardColor,
                )),
              ],
            ),
          ),
          BottomButton(
            onTap:  () {
              CalculatorBrain calc = CalculatorBrain(height: heightValue , weight: weightValue);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return ResultPage(
                      bmiResult: calc.calculateBMI(),
                      result: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  })
              );
            },
            title: 'Calculate',
          ),
        ],
      ),
    );
  }
}

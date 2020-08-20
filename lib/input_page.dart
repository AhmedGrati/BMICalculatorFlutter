import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_box.dart';
import 'icon_content.dart';
import 'gender.dart';
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor =  inactiveCardColor;
  Color femaleCardColor =  inactiveCardColor;
//  Color femaleCardColor =  Color(0xFF1D1E33);

  void changeCardColor(Gender gender) {
    if(gender == Gender.male) {
      if(maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }else{
        maleCardColor = inactiveCardColor;
      }
    }else{
      if(femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      }else{
        femaleCardColor = inactiveCardColor;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeCardColor(Gender.male);
                        });
                      },
                      child: CardBox(
                        colour: maleCardColor,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.mars,
                          content: 'Male',
                        )
                      ),
                    )
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeCardColor(Gender.female);
                        });
                      },
                      child: CardBox(
                        colour: femaleCardColor,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.venus,
                          content: 'Female',
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
          Expanded(child: CardBox(
            colour: inactiveCardColor,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(child: CardBox(
                  colour: inactiveCardColor,
                )),
                Expanded(child: CardBox(
                  colour: inactiveCardColor,
                ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: bottomColor
              ),
            ),
          )
        ],
      ),
    );
  }
}

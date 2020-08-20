import 'file:///C:/Users/Ahmed/Desktop/src/Projects/bmi_calculator/lib/components/bottom_button.dart';
import 'file:///C:/Users/Ahmed/Desktop/src/Projects/bmi_calculator/lib/components/card_box.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult , this.result , this.interpretation});

  final String bmiResult;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(16.0),
                child: Text('Your Result' ,
                  style: kResultStyling,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CardBox(
                colour: kActiveCardColor,
                onPress: () {},
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        this.result,
                        style: kInterpretationStyling,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        this.bmiResult,
                        style: kNumberResultStyling,
                      ),
                    ),
                    Expanded(
                      child: Text(this.interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ),
                    BottomButton(
                      title: 'Re-Calculate',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

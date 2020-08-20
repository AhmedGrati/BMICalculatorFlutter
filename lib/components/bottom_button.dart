import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {

  BottomButton({@required this.title , this.onTap});

  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        width: double.infinity,
        child: Center(
          child: Text(title ,
            style: kCalculateButtonStyle,
          ),
        ),
        height: kBottomHeight,
        decoration: BoxDecoration(
            color: kBottomColor
        ),
      ),
    );
  }
}

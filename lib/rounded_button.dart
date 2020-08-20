import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.iconData , this.onPress});
  final IconData iconData;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.0,
      shape: CircleBorder(),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

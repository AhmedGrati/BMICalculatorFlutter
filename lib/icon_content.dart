import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
class IconContent extends StatelessWidget {
  IconContent({@required this.iconData , this.content});
  final IconData iconData;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
            size: 80.0,
          ),
          SizedBox(height: 20.0,),
          Text(content ,
            style: kIconContentTextStyle,
          )
        ],
      ),
    );
  }
}

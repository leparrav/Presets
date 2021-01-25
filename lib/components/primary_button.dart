import 'package:flutter/material.dart';

import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final Function onPressed;
  final String label;

  const PrimaryButton(
      {Key key, this.width, this.onPressed, this.label = 'Use this preset'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: width,
        decoration: BoxDecoration(
          color: kPrimaryColor1,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontSize: 16, color: kPrimaryColor3),
          ),
        ),
      ),
    );
  }
}

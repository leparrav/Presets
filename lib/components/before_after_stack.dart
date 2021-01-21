import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';

class BeforeAfterStack extends StatefulWidget {
  final double imageHeight;

  const BeforeAfterStack({Key key, @required this.imageHeight})
      : super(key: key);

  @override
  _BeforeAfterStackState createState() => _BeforeAfterStackState(imageHeight);
}

class _BeforeAfterStackState extends State<BeforeAfterStack> {
  final double imageHeight;

  _BeforeAfterStackState(this.imageHeight);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BeforeAfter(
        beforeImage: Image.asset('assets/images/portrait/1_after.jpg'),
        afterImage: Image.asset('assets/images/portrait/1_after.jpg'),
        imageHeight: imageHeight,
      ),
      Positioned(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Original"),
          ),
        ),
        left: 40,
        bottom: 20,
      ),
      Positioned(
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Text("After"),
          ),
        ),
        right: 40,
        bottom: 20,
      ),
    ]);
  }
}

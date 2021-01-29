import 'dart:io';

import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';

class BeforeAfterStack extends StatefulWidget {
  final double imageHeight;
  final List<double> colorMatrix;
  final File imageSelected;

  const BeforeAfterStack({
    Key key,
    @required this.imageHeight,
    @required this.colorMatrix,
    this.imageSelected,
  }) : super(key: key);

  @override
  _BeforeAfterStackState createState() => _BeforeAfterStackState();
}

class _BeforeAfterStackState extends State<BeforeAfterStack> {
  _BeforeAfterStackState();
  ColorFiltered imageFiltered;

  ColorFiltered setImageFilter() {
    imageFiltered = ColorFiltered(
      colorFilter: ColorFilter.matrix(widget.colorMatrix),
      child: Image.file(widget.imageSelected),
    );

    return imageFiltered;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BeforeAfter(
        beforeImage: Image.file(widget.imageSelected),
        afterImage: setImageFilter(),
        imageHeight: widget.imageHeight,
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

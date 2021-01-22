import 'package:flutter/material.dart';
import 'package:preset_app/components/before_after_stack.dart';
import 'package:preset_app/components/primary_button.dart';

import '../constants.dart';

class UsePresetScreen extends StatefulWidget {
  static String id = 'UsePresetScreen';
  final List<double> colorMatrix;

  const UsePresetScreen({Key key, @required this.colorMatrix})
      : super(key: key);

  @override
  _UsePresetScreenState createState() => _UsePresetScreenState();
}

class _UsePresetScreenState extends State<UsePresetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            BeforeAfterStack(
              imageHeight: 500,
              colorMatrix: widget.colorMatrix,
            ),
            SizedBox(height: 20.0),
            Slider(
              label: "Intensity",
              value: 0.5,
              onChanged: (value) => {},
              activeColor: kPrimaryColor1,
              inactiveColor: kPrimaryColor1,
            ),
            SizedBox(height: 20.0),
            PrimaryButton(width: 300)
          ],
        ),
      ),
    );
  }
}

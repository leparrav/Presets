import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preset_app/components/before_after_stack.dart';
import 'package:preset_app/components/primary_button.dart';

import '../constants.dart';

class UsePresetScreen extends StatefulWidget {
  static String id = 'UsePresetScreen';

  @override
  _UsePresetScreenState createState() => _UsePresetScreenState();
}

class _UsePresetScreenState extends State<UsePresetScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            BeforeAfterStack(
              imageHeight: 500,
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

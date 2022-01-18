import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:preset_app/constants.dart';

class MenuDraggableText extends StatefulWidget {
  const MenuDraggableText({Key key}) : super(key: key);

  @override
  _MenuDraggableTextState createState() => _MenuDraggableTextState();
}

class _MenuDraggableTextState extends State<MenuDraggableText> {
  String _dropdownFontValue = 'One';
  double _sliderFontSizeValue = 20;

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

// raise the [showDialog] widget
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add text'),
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor1, //change background color of button
                onPrimary: kPrimaryColor4, //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: pickerColor,
                            onColorChanged: changeColor,
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              setState(() => currentColor = pickerColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Change color'),
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor1, //change background color of button
                onPrimary: kPrimaryColor4, //change text color of button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15.0,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DropdownButton<String>(
                value: _dropdownFontValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: kPrimaryColor4),
                onChanged: (String newValue) {
                  setState(() {
                    _dropdownFontValue = newValue;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        Slider(
          value: _sliderFontSizeValue,
          max: 60,
          label: _sliderFontSizeValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _sliderFontSizeValue = value;
            });
          },
        ),
      ],
    );
  }
}

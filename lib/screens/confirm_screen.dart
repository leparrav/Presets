import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class ConfirmScreen extends StatefulWidget {
  final File image;
  final List<double> colorFilterMatrix;

  const ConfirmScreen({Key key, this.image, this.colorFilterMatrix})
      : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  File _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Screenshot(
              controller: screenshotController,
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix(widget.colorFilterMatrix),
                child: Image.file(widget.image),
              ),
            ),
            RaisedButton.icon(
              onPressed: () {
                Share.share('check out my website https://example.com');
              },
              icon: Icon(Icons.share),
              label: Text('Share'),
            ),
            RaisedButton.icon(
              onPressed: () async {
                screenshotController.capture().then((File image) {
                  //Capture Done
                  setState(() {
                    _imageFile = image;
                  });
                }).catchError((onError) {
                  print(onError);
                });
              },
              icon: Icon(Icons.save),
              label: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

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
            SizedBox(
              height: 30.0,
            ),
            RaisedButton.icon(
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                screenshotController
                    .capture(
                  pixelRatio: 1.5,
                  delay: Duration(milliseconds: 10),
                )
                    .then((File image) {
                  List<String> paths = [];
                  paths.add(image.path);
                  Share.shareFiles(paths);
                }).catchError((onError) {
                  print(onError);
                });
              },
              icon: Icon(Icons.share),
              label: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}

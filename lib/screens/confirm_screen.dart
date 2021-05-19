import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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
              onPressed: () async {
                final directory = (await getApplicationDocumentsDirectory())
                    .path; //from path_provide package
                String fileName = 'Lighted-up';
                String path = '$directory';

                String result = await screenshotController.captureAndSave(
                    path, //set path where screenshot will be saved
                    fileName: fileName);

                List<String> paths;
                paths.add(path + fileName);
                Share.shareFiles(paths);
              },
              color: Colors.white,
              icon: Icon(Icons.share),
              label: Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}

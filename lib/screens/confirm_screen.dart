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
                Uint8List image = await screenshotController.capture(
                  pixelRatio: 1.5,
                );

                final tempDir = await getTemporaryDirectory();
                final file =
                    await new File('${tempDir.path}/image.jpg').create();
                file.writeAsBytesSync(image);

                List<String> paths = [];
                paths.add('${tempDir.path}/Lighted-up.jpg');
                Share.shareFiles(paths, text: 'Lighted up!');
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

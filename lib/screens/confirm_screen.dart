import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

import '../app.localization.dart';
import '../constants.dart';

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
            Expanded(
              child: Screenshot(
                controller: screenshotController,
                child: ColorFiltered(
                  colorFilter: ColorFilter.matrix(widget.colorFilterMatrix),
                  child: Image.file(widget.image),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      primary: Colors.black,
                      backgroundColor: kPrimaryColor2,
                      textStyle: GoogleFonts.indieFlower().copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      Uint8List image = await screenshotController.capture(
                        pixelRatio: 1.5,
                      );

                      final tempDir = await getTemporaryDirectory();
                      final file =
                          await new File('${tempDir.path}/Lighted-up.jpg')
                              .create();
                      file.writeAsBytesSync(image);

                      List<String> paths = [];
                      paths.add('${tempDir.path}/Lighted-up.jpg');
                      Share.shareFiles(paths);
                    },
                    icon: Icon(Icons.share),
                    label:
                        Text(AppLocalizations.of(context).translate('SHARE'))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

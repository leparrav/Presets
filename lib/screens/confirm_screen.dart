import 'dart:io';
import 'package:flutter/material.dart';
import 'package:preset_app/components/widget_to_image.dart';
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
  GlobalKey key;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            WidgetToImage(builder: (key) {
              this.key = key;

              return ColorFiltered(
                colorFilter: ColorFilter.matrix(widget.colorFilterMatrix),
                child: Image.file(widget.image),
              );
            }),
            RaisedButton.icon(
              onPressed: () {
                Share.share('check out my website https://example.com');
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

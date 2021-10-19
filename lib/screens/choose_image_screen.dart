import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preset_app/screens/use_preset_screen.dart';
import '../app.localization.dart';
import '../constants.dart';

class ImageChooserScreen extends StatefulWidget {
  const ImageChooserScreen({Key key, @required this.categorySelected})
      : super(key: key);
  final String categorySelected;

  @override
  _ImageChooserScreenState createState() => _ImageChooserScreenState();
}

class _ImageChooserScreenState extends State<ImageChooserScreen> {
  final picker = ImagePicker();
  File _image;

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return UsePresetScreen(
              image: _image,
              colorMatrix: kIdentityColorMatrix,
              categorySelected: widget.categorySelected,
            );
          }),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SimpleDialog(children: <Widget>[
      SimpleDialogOption(
        onPressed: () {
          getImage(ImageSource.camera);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              AppLocalizations.of(context).translate('CAMERA'),
            ),
            Icon(Icons.camera_alt_outlined),
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: () {
          getImage(ImageSource.gallery);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              AppLocalizations.of(context).translate('GALLERY'),
            ),
            Icon(Icons.add_photo_alternate_outlined),
          ],
        ),
      )
    ]));
  }
}

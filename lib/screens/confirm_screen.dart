import 'dart:io';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatefulWidget {
  final File image;
  final List<double> colorFilterMatrix;

  const ConfirmScreen({Key key, this.image, this.colorFilterMatrix})
      : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(widget.colorFilterMatrix),
          child: Image.file(widget.image),
        ),
      ),
    );
  }
}

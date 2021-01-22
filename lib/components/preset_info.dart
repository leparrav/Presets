import 'dart:convert';

class PresetInfo {
  String title;
  String imageBefore;
  String imageAfter;
  String description;
  List<double> colorMatrix;

  PresetInfo(
      {this.title,
      this.description,
      this.imageBefore,
      this.imageAfter,
      this.colorMatrix});

  factory PresetInfo.fromJson(Map<String, dynamic> jsonMap) {
    String colorString = jsonMap["colorMatrix"] as String;
    List<double> colorMatrix = colorString
        .split(",")
        .map(
          (e) => double.parse(e),
        )
        .toList();

    return PresetInfo(
        title: jsonMap["title"],
        description: jsonMap["description"],
        imageBefore: jsonMap["imageBefore"],
        imageAfter: jsonMap["imageAfter"],
        colorMatrix: colorMatrix);
  }
}

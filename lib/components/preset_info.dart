class PresetInfo {
  String title;
  String imageBefore;
  String imageAfter;
  String description;

  PresetInfo(
      { this.title,
        this.description,
        this.imageBefore,
        this.imageAfter,});


  factory PresetInfo.fromJson(Map<String, dynamic> json) {
    return PresetInfo(
        title: json["title"],
        description: json["description"],
        imageBefore: json["imageBefore"],
        imageAfter: json["imageAfter"]);
  }

}
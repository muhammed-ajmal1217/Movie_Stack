class CastModel {
  String? name;
  String? originalName;
  String? profilePath;
  String? character;
  String? department;
  CastModel(
      {required this.name,
      required this.originalName,
      required this.character,
      required this.department,
      required this.profilePath});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      originalName: json['original_name'],
      character: json['character'],
      department: json['known_for_department'],
      profilePath: json['profile_path'],
    );
  }
}
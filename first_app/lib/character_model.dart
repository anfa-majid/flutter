class Character {
  String name;
  String imgUrl;
  String affiliation;
  PhysicalDescription physicalDescription;

  Character({
    required this.name,
    required this.imgUrl,
    required this.affiliation,
    required this.physicalDescription,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? 'No name',
      imgUrl: json['image'] ?? 'https://via.placeholder.com/150',
      affiliation: json['affiliation'] ?? 'No affiliation',
      physicalDescription: PhysicalDescription.fromJson(json['physicalDescription'] ?? {}),
    );
  }
}

class PhysicalDescription {
  String gender;
  String eyeColor;
  String hairColor;

  PhysicalDescription({
    required this.gender,
    required this.eyeColor,
    required this.hairColor,
  });

  factory PhysicalDescription.fromJson(Map<String, dynamic> json) {
    return PhysicalDescription(
      gender: json['gender'] ?? 'Unknown',
      eyeColor: json['eyeColor'] ?? 'Unknown',
      hairColor: json['hairColor'] ?? 'Unknown',
    );
  }
}

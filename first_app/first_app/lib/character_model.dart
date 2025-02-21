class Character {
  final String name;
  final String imgUrl;
  final String affiliation;

  Character({
    required this.name,
    required this.imgUrl,
    required this.affiliation,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ??'No name',
      imgUrl: json['image'] ?? '',
      affiliation: json['affiliation'] ?? 'No affiliation',
    );
  }
}
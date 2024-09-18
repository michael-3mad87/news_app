class Sources {
  final String? id;
  final String? name;

  const Sources({this.id, this.name});

  factory Sources.fromJson(Map<String, dynamic> json) => Sources(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class User {
  String? id;
  String? name;
  String? email;
  double? weight;
  int? height;

  User({this.id, this.name, this.email, this.weight, this.height});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        weight: (json['weight'] as num?)?.toDouble(),
        height: json['height'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'weight': weight,
        'height': height,
      };
}

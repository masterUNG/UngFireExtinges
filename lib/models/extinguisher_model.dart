import 'dart:convert';

class ExtinguisherModel {
  final String image;
  final String location;
  final String name;
  ExtinguisherModel({
    required this.image,
    required this.location,
    required this.name,
  });

  ExtinguisherModel copyWith({
    String? image,
    String? location,
    String? name,
  }) {
    return ExtinguisherModel(
      image: image ?? this.image,
      location: location ?? this.location,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'location': location,
      'name': name,
    };
  }

  factory ExtinguisherModel.fromMap(Map<String, dynamic> map) {
    return ExtinguisherModel(
      image: map['image'],
      location: map['location'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExtinguisherModel.fromJson(String source) => ExtinguisherModel.fromMap(json.decode(source));

  @override
  String toString() => 'ExtinguisherModel(image: $image, location: $location, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ExtinguisherModel &&
      other.image == image &&
      other.location == location &&
      other.name == name;
  }

  @override
  int get hashCode => image.hashCode ^ location.hashCode ^ name.hashCode;
}

class Song {
  Song({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.length,
    required this.genre,
    required this.image,
  });

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json['id'] as String,
        createdAt: json['createdAt'] as String,
        name: json['name'] as String,
        length: json['length'] as int,
        genre: json['genre'] as String,
        image: json['image'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdAt': createdAt,
        'name': name,
        'length': length,
        'genre': genre,
        'image': image,
      };

  String id;
  String createdAt;
  String name;
  int length;
  String genre;
  String image;
}

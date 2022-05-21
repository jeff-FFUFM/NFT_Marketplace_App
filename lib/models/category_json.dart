class Category {
  String id;
  String title;
  String backgroundImage;
  String subtitle;

  Category({
    required this.id,
    required this.title,
    required this.backgroundImage,
    required this.subtitle,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      title: json['title'] as String,
      backgroundImage: json['backgroundImage'] as String,
      subtitle: json['subtitle'] as String,
    );
  }
}

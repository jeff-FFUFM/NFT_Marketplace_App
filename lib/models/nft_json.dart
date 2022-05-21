class NFT {
  String id;
  String dishImage;
  String title;
  String price;
  String source;
  List<String> information;

  NFT({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.price,
    required this.source,
    required this.information,
  });

  factory NFT.fromJson(Map<String, dynamic> json) {
    return NFT(
      id: json['id'] as String,
      dishImage: json['dishImage'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      source: json['source'] as String,
      information: json['information'].cast<String>() as List<String>,
    );
  }
}

class Book {
  final String title;
  final String cover_image_url;
  final String price_in_dollar;
  final List<String>? categories;
  final List<String>? available_format;

  const Book({
    required this.title,
    required this.cover_image_url,
    required this.price_in_dollar,
    required this.categories,
    required this.available_format,
  });

  static Book fromJson(json) {
    // var categoriesFromJson = json['categories'];
    // var categoryJson = jsonDecode(json)['categories'];
    // List<String>? categories = categoryJson != null ? List.from(categoryJson) : null;

    // List<String> categoriesList = categoriesFromJson;
    // var available_formatFromJson = json['available_format'];
    // List<String> available_formatList = available_formatFromJson as List<String>;
    return Book(
      title: json['title'],
      cover_image_url: json['cover_image_url'],
      price_in_dollar: json['price_in_dollar'].toString(),
      // categories: json['categories'].cast<String>() ?? '',
      categories: json['categories'] == null
          ? []
          : List<String>.from(json["categories"].map((x) => x)),
      available_format: json['available_format'].cast<String>() ?? '',
    );
  }
}

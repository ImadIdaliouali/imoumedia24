import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  final int categoryId;
  final String date;
  final String title;
  final String imageUrl;
  final String content;
  final String link;

  const News({
    required this.categoryId,
    required this.date,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.link,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        categoryId: json["categories"][0],
        date: json["date"],
        title: json["title"]["rendered"],
        imageUrl: json["jetpack_featured_media_url"],
        content: json["content"]["rendered"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "date": date,
        "title": title,
        "imageUrl": imageUrl,
        "content": content,
        "link": link,
      };
}

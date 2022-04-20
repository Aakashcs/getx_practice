class Article {
  final int id;
  final int userId;
  final String title;
  final String body;

  Article(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      userId: json['userId'],
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}

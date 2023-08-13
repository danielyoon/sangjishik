class Post {
  final String title, post, image;
  final List<String> tags;
  final int id;
  final DateTime date;
  final List<Map<String, String>>? comments;

  Post(this.title, this.post, this.image, this.tags, this.id, this.date, this.comments);

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        title = json['title'] ?? '',
        post = json['post'] ?? '',
        image = json['image'] ?? '',
        tags = json['tags'] ?? [],
        date = json['date'] ?? '',
        comments = json['comments'];
}

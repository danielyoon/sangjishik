class Post {
  final List<String> topic;
  final String post;
  final List<Map<String, String>> comments;
  final int likes;
  final DateTime date;

  Post(this.topic, this.post, this.comments, this.likes, this.date);
}

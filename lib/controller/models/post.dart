import 'package:sangjishik/controller/utils/string_utils.dart';

class Post {
  final String title, post, image, date;
  final List<String> tags;
  final int id;

  Post(this.title, this.post, this.image, this.tags, this.id, this.date);

  Post.fromJson(Map<String, dynamic> json)
      : id = json['count'] ?? 0,
        title = json['title'] ?? '',
        post = json['post'] ?? '',
        image = json['image'] ?? '',
        tags = StringUtils.formatTags(json['tags']) ?? [],
        date = StringUtils.formatDateString(json['dateCreated']) ?? '';
}

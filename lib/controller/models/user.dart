class User {
  final String id, email, role;
  final List<String>? likedPosts;

  User(this.id, this.email, this.role, this.likedPosts);

  //TODO: Add a to parse array of Strings from json
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        email = json['email'] ?? '',
        role = json['role'] ?? '',
        likedPosts = [];
}

class User {
  final String id, email, role;
  final List<String>? likedPosts;

  User(this.id, this.email, this.role, this.likedPosts);
}

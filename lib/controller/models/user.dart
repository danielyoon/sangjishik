class User {
  final String id, email, role, dateCreated;

  User(this.id, this.email, this.role, this.dateCreated);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        email = json['email'] ?? '',
        role = json['role'] ?? '',
        dateCreated = json['dateCreated'] ?? '';
}

class User {
  final String id;
  final String name;
  final String email;
  final String? profileUrl;
  final bool isEmailVerified;

  User(
      {this.id = '0',
      this.name = '',
      this.email = '',
      this.profileUrl,
      this.isEmailVerified = false});
}

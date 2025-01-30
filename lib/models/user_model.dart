class UserModel {
  final String id;
  final String displayName;
  final String email;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  factory UserModel.fromFirebase(dynamic user) {
    return UserModel(
      id: user.uid,
      displayName: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }
}
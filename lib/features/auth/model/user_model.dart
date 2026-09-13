class UserModel {
  const UserModel({
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] as String? ?? '',
    );
  }

  final String token;
}

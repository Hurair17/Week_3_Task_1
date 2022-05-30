class SignUpModel {
  String? userId;
  String? email;
  String? name;
  SignUpModel({
    this.userId,
    this.email,
    this.name,
  });

  factory SignUpModel.fromMap(map) {
    return SignUpModel(
      userId: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
    };
  }
}

import 'dart:convert';

class UserModel {
  final int id;
  final bool isVerified;

  const UserModel({
    required this.id,
    required this.isVerified
  });

  factory UserModel.fromJson(String source) => 
    UserModel.fromMap(jsonDecode(source) as Map<String, dynamic>);
  
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int, 
      isVerified: map['isVerified'] as bool
    );
  }

  Map<String, dynamic> toMap() => {'id': id, 'isVerified': isVerified};

  String toJson() => jsonEncode(toMap());
}
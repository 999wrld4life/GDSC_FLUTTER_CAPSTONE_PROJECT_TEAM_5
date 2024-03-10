import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  final String roll;

  const MyUser({
    required this.uid,
    required this.name,
    required this.email,
    this.imageUrl = 'https://icons.iconarchive.com/icons/papirus-team/papirus-status/256/avatar-default-icon.png',
    this.roll = 'user',
  });

  MyUser copyWith({
    String? uid,
    String? name,
    String? email,
    String? imageUrl,
    String? roll,
  }) {
    return MyUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      roll: roll ?? this.roll,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'roll': roll,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String ,
      roll: map['roll'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyUser.fromJson(String source) =>
      MyUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [uid, name, email, roll];
}

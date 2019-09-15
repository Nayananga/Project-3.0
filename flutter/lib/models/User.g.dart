// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => new User(
    google_id: json['google_id'] as String,
    email: json['email'] as String,
    nickname: json['nickname'] as String,
    image: json['image'] as String,
    phoneNo: json['phoneNo'] as String,
    nic: json['nic'] as String);

abstract class _$UserSerializerMixin {
  String get email;

  String get google_id;

  String get image;

  String get nic;

  String get nickname;

  String get phoneNo;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'google_id': google_id,
        'email': email,
        'nickname': nickname,
        'image': image,
        'phoneNo': phoneNo,
        'nic': nic
      };
}

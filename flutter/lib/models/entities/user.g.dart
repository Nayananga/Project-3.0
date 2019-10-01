// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      googleId: json['googleId'] as String,
      email: json['email'] as String,
      nickname: json['nickname'] as String,
      image: json['image'] as String,
      phoneNo: json['phoneNo'] as String,
      nic: json['nic'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'googleId': instance.googleId,
      'email': instance.email,
      'nickname': instance.nickname,
      'image': instance.image,
      'phoneNo': instance.phoneNo,
      'nic': instance.nic
    };

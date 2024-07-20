// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['organizationId'] as String?,
      json['organizationName'] as String?,
      json['userId'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['cellphone'] as String?,
      json['password'] as String?,
      json['date'] as String?,
      json['profileUrl'] as String?,
      json['splashImageUrl'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'cellphone': instance.cellphone,
      'password': instance.password,
      'date': instance.date,
      'profileUrl': instance.profileUrl,
      'splashImageUrl': instance.splashImageUrl,
    };

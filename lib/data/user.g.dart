// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationUser _$OrganizationUserFromJson(Map<String, dynamic> json) =>
    OrganizationUser(
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

Map<String, dynamic> _$OrganizationUserToJson(OrganizationUser instance) =>
    <String, dynamic>{
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

BidvestUser _$BidvestUserFromJson(Map<String, dynamic> json) => BidvestUser(
      json['name'] as String?,
      json['email'] as String?,
      json['cellphone'] as String?,
      json['password'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$BidvestUserToJson(BidvestUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'cellphone': instance.cellphone,
      'password': instance.password,
      'date': instance.date,
    };

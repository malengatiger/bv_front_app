// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) => Organization(
      json['organizationId'] as String?,
      json['brandingId'] as String?,
      json['date'] as String?,
      json['logoUrl'] as String?,
      json['splashImageUrl'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'organizationId': instance.organizationId,
      'name': instance.name,
      'brandingId': instance.brandingId,
      'date': instance.date,
      'logoUrl': instance.logoUrl,
      'splashImageUrl': instance.splashImageUrl,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) => Organization(
      json['organizationId'] as String?,
      json['name'] as String?,
      json['adminName'] as String?,
      json['date'] as String?,
      json['adminEmail'] as String?,
      json['adminCellphone'] as String?,
      json['adminPassword'] as String?,
    );

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'organizationId': instance.organizationId,
      'name': instance.name,
      'adminName': instance.adminName,
      'date': instance.date,
      'adminEmail': instance.adminEmail,
      'adminCellphone': instance.adminCellphone,
      'adminPassword': instance.adminPassword,
    };

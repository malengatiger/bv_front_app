// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branding _$BrandingFromJson(Map<String, dynamic> json) => Branding(
      json['organizationId'] as String?,
      json['brandingId'] as String?,
      json['date'] as String?,
      json['logoUrl'] as String?,
      json['splashImageUrl'] as String?,
      json['organizationName'] as String?,
    );

Map<String, dynamic> _$BrandingToJson(Branding instance) => <String, dynamic>{
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'brandingId': instance.brandingId,
      'date': instance.date,
      'logoUrl': instance.logoUrl,
      'splashImageUrl': instance.splashImageUrl,
    };

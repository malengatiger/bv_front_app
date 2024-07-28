// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) =>
    UploadResponse(
      json['downloadUrl'] as String?,
      json['date'] as String?,
    );

Map<String, dynamic> _$UploadResponseToJson(UploadResponse instance) =>
    <String, dynamic>{
      'downloadUrl': instance.downloadUrl,
      'date': instance.date,
    };

OrganizationBranding _$OrganizationBrandingFromJson(
        Map<String, dynamic> json) =>
    OrganizationBranding(
      json['brandingId'] as String?,
      json['organizationId'] as String?,
      json['organizationName'] as String?,
      json['date'] as String?,
      json['logoUrl'] as String?,
      json['splashImageUrl'] as String?,
      json['bannerImageUrl'] as String?,
    );

Map<String, dynamic> _$OrganizationBrandingToJson(
        OrganizationBranding instance) =>
    <String, dynamic>{
      'brandingId': instance.brandingId,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'date': instance.date,
      'logoUrl': instance.logoUrl,
      'splashImageUrl': instance.splashImageUrl,
      'bannerImageUrl': instance.bannerImageUrl,
    };

UserBranding _$UserBrandingFromJson(Map<String, dynamic> json) => UserBranding(
      json['brandingId'] as String?,
      json['organizationId'] as String?,
      json['organizationName'] as String?,
      json['date'] as String?,
      json['profileImageUrl'] as String?,
      json['splashImageUrl'] as String?,
      json['userId'] as String?,
      json['userName'] as String?,
    );

Map<String, dynamic> _$UserBrandingToJson(UserBranding instance) =>
    <String, dynamic>{
      'brandingId': instance.brandingId,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'date': instance.date,
      'profileImageUrl': instance.profileImageUrl,
      'splashImageUrl': instance.splashImageUrl,
      'userId': instance.userId,
      'userName': instance.userName,
    };

OrganizationLocation _$OrganizationLocationFromJson(
        Map<String, dynamic> json) =>
    OrganizationLocation(
      json['name'] as String?,
      json['organizationId'] as String?,
      json['organizationName'] as String?,
      json['date'] as String?,
      json['geoHash'] as String?,
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrganizationLocationToJson(
        OrganizationLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'date': instance.date,
      'geoHash': instance.geoHash,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

BidvestDivision _$BidvestDivisionFromJson(Map<String, dynamic> json) =>
    BidvestDivision(
      json['name'] as String?,
      json['date'] as String?,
      json['divisionId'] as String?,
      json['adminEmail'] as String?,
      json['adminCellphone'] as String?,
      json['adminPassword'] as String?,
    );

Map<String, dynamic> _$BidvestDivisionToJson(BidvestDivision instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'divisionId': instance.divisionId,
      'adminEmail': instance.adminEmail,
      'adminCellphone': instance.adminCellphone,
      'adminPassword': instance.adminPassword,
    };

OrganizationBidvestDivision _$OrganizationBidvestDivisionFromJson(
        Map<String, dynamic> json) =>
    OrganizationBidvestDivision(
      json['divisionId'] as String?,
      json['organizationId'] as String?,
      json['organizationName'] as String?,
      json['date'] as String?,
      json['divisionName'] as String?,
      json['orgDivisionId'] as String?,
    );

Map<String, dynamic> _$OrganizationBidvestDivisionToJson(
        OrganizationBidvestDivision instance) =>
    <String, dynamic>{
      'divisionId': instance.divisionId,
      'organizationId': instance.organizationId,
      'organizationName': instance.organizationName,
      'date': instance.date,
      'divisionName': instance.divisionName,
      'orgDivisionId': instance.orgDivisionId,
    };

SurveyRow _$SurveyRowFromJson(Map<String, dynamic> json) => SurveyRow(
      surveyTemplateId: json['surveyTemplateId'] as String?,
      sectionId: json['sectionId'] as String?,
      text: json['text'] as String?,
      rating: (json['rating'] as num?)?.toInt(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$SurveyRowToJson(SurveyRow instance) => <String, dynamic>{
      'surveyTemplateId': instance.surveyTemplateId,
      'sectionId': instance.sectionId,
      'text': instance.text,
      'rating': instance.rating,
      'date': instance.date,
    };

SurveySection _$SurveySectionFromJson(Map<String, dynamic> json) =>
    SurveySection(
      json['surveyTemplateId'] as String?,
      json['sectionId'] as String?,
      json['name'] as String?,
      (json['rows'] as List<dynamic>)
          .map((e) => SurveyRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurveySectionToJson(SurveySection instance) =>
    <String, dynamic>{
      'surveyTemplateId': instance.surveyTemplateId,
      'sectionId': instance.sectionId,
      'name': instance.name,
      'rows': instance.rows.map((e) => e.toJson()).toList(),
    };

SurveyTemplate _$SurveyTemplateFromJson(Map<String, dynamic> json) =>
    SurveyTemplate(
      surveyTemplateId: json['surveyTemplateId'] as String?,
      name: json['name'] as String?,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SurveySection.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$SurveyTemplateToJson(SurveyTemplate instance) =>
    <String, dynamic>{
      'surveyTemplateId': instance.surveyTemplateId,
      'name': instance.name,
      'date': instance.date,
      'sections': instance.sections.map((e) => e.toJson()).toList(),
    };

SurveyResponse _$SurveyResponseFromJson(Map<String, dynamic> json) =>
    SurveyResponse(
      surveyTemplateId: json['surveyTemplateId'] as String?,
      name: json['name'] as String?,
      date: json['date'] as String?,
      surveyId: json['surveyId'] as String?,
      divisionId: json['divisionId'] as String?,
      divisionName: json['divisionName'] as String?,
      organizationName: json['organizationName'] as String?,
      organizationId: json['organizationId'] as String?,
      surveyTemplate: json['surveyTemplate'] == null
          ? null
          : SurveyTemplate.fromJson(
              json['surveyTemplate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SurveyResponseToJson(SurveyResponse instance) =>
    <String, dynamic>{
      'surveyTemplateId': instance.surveyTemplateId,
      'name': instance.name,
      'date': instance.date,
      'surveyId': instance.surveyId,
      'divisionId': instance.divisionId,
      'divisionName': instance.divisionName,
      'organizationName': instance.organizationName,
      'organizationId': instance.organizationId,
      'surveyTemplate': instance.surveyTemplate?.toJson(),
    };

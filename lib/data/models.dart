import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadResponse {
  String? downloadUrl, date;

  UploadResponse(this.downloadUrl, this.date);

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadResponseToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class OrganizationBranding {
  String? brandingId,
      organizationId,
      organizationName,
      date,
      logoUrl,
      splashImageUrl,
      bannerImageUrl;

  OrganizationBranding(
      this.brandingId,
      this.organizationId,
      this.organizationName,
      this.date,
      this.logoUrl,
      this.splashImageUrl,
      this.bannerImageUrl);

  factory OrganizationBranding.fromJson(Map<String, dynamic> json) =>
      _$OrganizationBrandingFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationBrandingToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class UserBranding {
  String? brandingId,
      organizationId,
      organizationName,
      date,
      profileImageUrl,
      splashImageUrl,
      userId,
      userName;

  UserBranding(
      this.brandingId,
      this.organizationId,
      this.organizationName,
      this.date,
      this.profileImageUrl,
      this.splashImageUrl,
      this.userId,
      this.userName);

  factory UserBranding.fromJson(Map<String, dynamic> json) =>
      _$UserBrandingFromJson(json);

  Map<String, dynamic> toJson() => _$UserBrandingToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class OrganizationLocation {
  String? name, organizationId, organizationName, date, geoHash;

  double? latitude, longitude;

  OrganizationLocation(this.name, this.organizationId, this.organizationName,
      this.date, this.geoHash, this.latitude, this.longitude);

  factory OrganizationLocation.fromJson(Map<String, dynamic> json) =>
      _$OrganizationLocationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationLocationToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class BidvestDivision {
  String? name, date, divisionId, adminEmail, adminCellphone, adminPassword;

  BidvestDivision(this.name, this.date, this.divisionId, this.adminEmail,
      this.adminCellphone, this.adminPassword);

  factory BidvestDivision.fromJson(Map<String, dynamic> json) =>
      _$BidvestDivisionFromJson(json);

  Map<String, dynamic> toJson() => _$BidvestDivisionToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class OrganizationBidvestDivision {
  String? divisionId,
      organizationId,
      organizationName,
      date,
      divisionName,
      orgDivisionId;

  OrganizationBidvestDivision(this.divisionId, this.organizationId,
      this.organizationName, this.date, this.divisionName, this.orgDivisionId);

  factory OrganizationBidvestDivision.fromJson(Map<String, dynamic> json) =>
      _$OrganizationBidvestDivisionFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationBidvestDivisionToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class SurveyRow {
  String? surveyTemplateId, sectionId, text;
  int? rating;
  String? date;

  SurveyRow(
      {this.surveyTemplateId,
      this.sectionId,
      this.text,
      this.rating,
      this.date});

  factory SurveyRow.fromJson(Map<String, dynamic> json) =>
      _$SurveyRowFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyRowToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class SurveySection {
  String? surveyTemplateId, sectionId, name;
  List<SurveyRow> rows = [];

  SurveySection(this.surveyTemplateId, this.sectionId, this.name, this.rows);

  factory SurveySection.fromJson(Map<String, dynamic> json) =>
      _$SurveySectionFromJson(json);

  Map<String, dynamic> toJson() => _$SurveySectionToJson(this);
}

//
@JsonSerializable(explicitToJson: true)
class SurveyTemplate {
  String? surveyTemplateId, name, date;
  List<SurveySection> sections = [];

  SurveyTemplate(
      {required this.surveyTemplateId,
      required this.name,
      required this.sections,
      required this.date});

  factory SurveyTemplate.fromJson(Map<String, dynamic> json) =>
      _$SurveyTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyTemplateToJson(this);
}

/*
export interface SurveyResponse {
  surveyTemplateId: string;
  surveyId: string;
  date: string;
  divisionId: string;
  divisionName: string;
  organizationName: string;
  organizationId: string;
  surveyTemplate: SurveyTemplate;
}
 */
@JsonSerializable(explicitToJson: true)
class SurveyResponse {
  String? surveyTemplateId,
      name,
      date,
      surveyId,
      divisionId,
      divisionName,
      organizationName,
      organizationId;
  SurveyTemplate? surveyTemplate;

  SurveyResponse(
      {required this.surveyTemplateId,
      required this.name,
      required this.date,
      required this.surveyId,
      this.divisionId,
      this.divisionName,
      this.organizationName,
      this.organizationId,
      required this.surveyTemplate});

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyResponseToJson(this);
}

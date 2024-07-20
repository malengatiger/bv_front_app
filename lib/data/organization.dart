
import 'package:json_annotation/json_annotation.dart';
part 'organization.g.dart';

@JsonSerializable()
class Organization {
  String? organizationId, name;
  String? brandingId;
  String? date;
  String? logoUrl, splashImageUrl;

  Organization(this.organizationId, this.brandingId, this.date, this.logoUrl,
      this.splashImageUrl, this.name);

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}



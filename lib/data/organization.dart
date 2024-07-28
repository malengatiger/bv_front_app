
import 'package:json_annotation/json_annotation.dart';
part 'organization.g.dart';

@JsonSerializable()
class Organization {
  String? organizationId, name;
  String? adminName;
  String? date;
  String? adminEmail, adminCellphone, adminPassword;


  Organization(this.organizationId, this.name, this.adminName, this.date,
      this.adminEmail, this.adminCellphone, this.adminPassword);

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}



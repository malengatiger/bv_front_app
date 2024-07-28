
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class OrganizationUser implements Person {
  String? organizationId, organizationName;
  String? userId, name;
  String? email, cellphone, password;
  String? date;
  String? profileUrl, splashImageUrl;


  OrganizationUser(
      this.organizationId,
      this.organizationName,
      this.userId,
      this.name,
      this.email,
      this.cellphone,
      this.password,
      this.date,
      this.profileUrl,
      this.splashImageUrl);

  factory OrganizationUser.fromJson(Map<String, dynamic> json) =>
      _$OrganizationUserFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationUserToJson(this);
}

@JsonSerializable()
class BidvestUser implements Person{
  String? name;
  String? email, cellphone, password;
  String? date;


  BidvestUser(
      this.name,
      this.email,
      this.cellphone,
      this.password,
      this.date);

  factory BidvestUser.fromJson(Map<String, dynamic> json) =>
      _$BidvestUserFromJson(json);

  Map<String, dynamic> toJson() => _$BidvestUserToJson(this);
}

abstract class Person {}
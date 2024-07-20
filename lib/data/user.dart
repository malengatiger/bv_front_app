
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? organizationId, organizationName;
  String? userId, name;
  String? email, cellphone, password;
  String? date;
  String? profileUrl, splashImageUrl;


  User(
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

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}



import 'package:json_annotation/json_annotation.dart';
part 'branding.g.dart';

@JsonSerializable()
class Branding {
  String? organizationId, organizationName;
  String? brandingId;
  String? date;
  String? logoUrl, splashImageUrl;

  Branding(this.organizationId, this.brandingId, this.date, this.logoUrl,
      this.splashImageUrl, this.organizationName);

  factory Branding.fromJson(Map<String, dynamic> json) =>
      _$BrandingFromJson(json);

  Map<String, dynamic> toJson() => _$BrandingToJson(this);
}

const int boxFitCover = 1;
const int boxFitFill = 2;
const int boxFitHeight = 3;
const int boxFitWidth = 4;



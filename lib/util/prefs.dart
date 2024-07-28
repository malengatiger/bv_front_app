import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';


import '../data/branding.dart';
import '../data/organization.dart';
import '../data/user.dart';
import '../util.dart';

class UserBag {
  OrganizationUser? organizationUser;
  BidvestUser? bidvestUser;

  UserBag(this.organizationUser, this.bidvestUser);
}

class Prefs {
  final SharedPreferences sharedPreferences;
  static const mm = '💜💜💜💜💜Prefs 💜💜';

  Prefs(this.sharedPreferences);

  UserBag getUser()  {
    var orgUser = _getOrganizationUser();
    if (orgUser != null) {
      pp('$mm ... we have an Organization User! ${orgUser.name}');
      var bag = UserBag(orgUser, null);
      return bag;
    }
    var bvUser = _getBidvestUser();
    if (bvUser != null) {
      pp('$mm ... we have a Bidvest User! ${bvUser.name}');
      var bag = UserBag(null, bvUser);
      return bag;
    }
    return UserBag(null,null);
  }

  void saveOrganizationUser(OrganizationUser user)  {
    Map mJson = user.toJson();
    var jx = json.encode(mJson);
    sharedPreferences.setString('user', jx);
    pp('$mm ... saveOrganizationUser: saved OK');
  }

  OrganizationUser? _getOrganizationUser() {
    var string = sharedPreferences.getString('user');
    if (string == null) {
      return null;
    }
    var jx = json.decode(string);
    var user = OrganizationUser.fromJson(jx);
    return user;
  }

  Future saveBidvestUser(BidvestUser user) async {
    Map mJson = user.toJson();
    var jx = json.encode(mJson);
    sharedPreferences.setString('bidvestUser', jx);
    pp('$mm ... sgelaUser saved OK');
  }

  BidvestUser? _getBidvestUser() {
    var string = sharedPreferences.getString('bidvestUser');
    if (string == null) {
      return null;
    }
    var jx = json.decode(string);
    var user = BidvestUser.fromJson(jx);
    return user;
  }

  void saveBrand(Branding brand) {
    Map mJson = brand.toJson();
    var jx = json.encode(mJson);
    sharedPreferences.setString('brand', jx);
    pp('$mm ... branding saved OK: ${brand.organizationName}');
  }

  Branding? getBrand() {
    var string = sharedPreferences.getString('brand');
    if (string == null) {
      return null;
    }
    var jx = json.decode(string);
    var b = Branding.fromJson(jx);
    pp('$mm ... branding gotten OK: ${b.organizationName}');

    return b;
  }

  void saveOrganization(Organization organization) {
    Map mJson = organization.toJson();
    var jx = json.encode(mJson);
    sharedPreferences.setString('Organization', jx);
    pp('$mm ... organization saved OK: ${organization.name}');
  }

  Organization? getOrganization() {
    var string = sharedPreferences.getString('Organization');
    if (string == null) {
      return null;
    }
    var jx = json.decode(string);
    var org = Organization.fromJson(jx);
    pp('$mm ... organization retrieved OK: ${org.name}');

    return org;
  }

  void saveMode(int mode) {
    sharedPreferences.setInt('mode', mode);
  }

  int getMode() {
    var mode = sharedPreferences.getInt('mode');
    if (mode == null) {
      pp('$mm ... mode not found, returning -1');
      return -1;
    }
    return mode;
  }

  void saveColorIndex(int index) async {
    sharedPreferences.setInt('color', index);
    pp('$mm ... color index cached: $index');
    return null;
  }

  int getColorIndex() {
    var color = sharedPreferences.getInt('color');
    if (color == null) {
      pp('$mm ... return default color index 0');
      return 0;
    }
    return color;
  }

  void saveInstructionCount(int index) async {
    int c = getInstructionCount();
    sharedPreferences.setInt('instructionCount', index + c);

    pp('$mm ... color index cached: $index');
    return null;
  }

  int getInstructionCount() {
    var count = sharedPreferences.getInt('instructionCount');
    if (count == null) {
      pp('$mm ... return instructionCount = 0');
      return 0;
    }
    pp('$mm ... instructionCount: $count');
    return count;
  }

  //
  saveBrandings(List<Branding> brandings) {
    List<Map<String, dynamic>> brandingStrings =
        brandings.map((pm) => pm.toJson()).toList();
    List<String> brandingJsonStrings =
        brandingStrings.map((pm) => json.encode(pm)).toList();
    sharedPreferences.setStringList('brandings', brandingJsonStrings);
    pp('$mm ... brandings saved OK: ${brandings.length}');
  }

  List<Branding> getBrandings() {
    List<String>? brandingJsonStrings =
        sharedPreferences.getStringList('brandings');
    if (brandingJsonStrings != null) {
      List<Branding> brandings = brandingJsonStrings
          .map((pmJson) => Branding.fromJson(json.decode(pmJson)))
          .toList();
      pp('$mm ... brandings retrieved: ${brandings.length}');

      return brandings;
    } else {
      return [];
    }
  }


}

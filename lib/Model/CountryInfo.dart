// class CountryInfo {
//   CountryInfo({
//     required this.id,
//     required this.iso2,
//     required this.iso3,
//     required this.lat,
//     required this.long,
//     required this.flag,
//   });
//
//   CountryInfo.fromJson(dynamic json) {
//     id = json['_id'];
//     iso2 = json['iso2'];
//     iso3 = json['iso3'];
//     lat = json['lat'];
//     long = json['long'];
//     flag = json['flag'];
//   }
//   int id;
//   String iso2;
//   String iso3;
//   int lat;
//   int long;
//   String flag;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['_id'] = id;
//     map['iso2'] = iso2;
//     map['iso3'] = iso3;
//     map['lat'] = lat;
//     map['long'] = long;
//     map['flag'] = flag;
//     return map;
//   }
// }

/// id : 1
/// name : " إذاعة إبراهيم الأخضر"
/// url : "https://backup.qurango.net/radio/ibrahim_alakdar"

class Radios {
  Radios({
      this.id, 
      this.name, 
      this.url,});

  Radios.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
  num? id;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}
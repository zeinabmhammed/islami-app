/// code : 200
/// status : "OK"
/// data : {"timings":{"Fajr":"04:22","Sunrise":"06:04","Dhuhr":"13:01","Asr":"16:38","Sunset":"19:57","Maghrib":"19:57","Isha":"21:28","Imsak":"04:12","Midnight":"01:01","Firstthird":"23:20","Lastthird":"02:42"},"date":{"readable":"16 Jul 2024","timestamp":"1721102400","hijri":{"date":"10-01-1446","format":"DD-MM-YYYY","day":"10","weekday":{"en":"Al Thalaata","ar":"الثلاثاء"},"month":{"number":1,"en":"Muḥarram","ar":"مُحَرَّم","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":["Ashura","Urs of Shaykh Shamsuddin Habīb Allah ق","Urs of Shaykh Abū al‑Hassan al‑Kharqāni ق","Birth of Imam Rābbani Ahmad Al-Fāruqi As-Sirhindi ق"],"adjustedHolidays":[],"method":"HJCoSA"},"gregorian":{"date":"16-07-2024","format":"DD-MM-YYYY","day":"16","weekday":{"en":"Tuesday"},"month":{"number":7,"en":"July"},"year":"2024","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}},"meta":{"latitude":8.8888888,"longitude":7.7777777,"timezone":"Africa/Cairo","method":{"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}},"latitudeAdjustmentMethod":"ANGLE_BASED","midnightMode":"STANDARD","school":"STANDARD","offset":{"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}}}

class PrayerModel {
  PrayerModel({
      this.code, 
      this.status, 
      this.data,});

  PrayerModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? code;
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// timings : {"Fajr":"04:22","Sunrise":"06:04","Dhuhr":"13:01","Asr":"16:38","Sunset":"19:57","Maghrib":"19:57","Isha":"21:28","Imsak":"04:12","Midnight":"01:01","Firstthird":"23:20","Lastthird":"02:42"}
/// date : {"readable":"16 Jul 2024","timestamp":"1721102400","hijri":{"date":"10-01-1446","format":"DD-MM-YYYY","day":"10","weekday":{"en":"Al Thalaata","ar":"الثلاثاء"},"month":{"number":1,"en":"Muḥarram","ar":"مُحَرَّم","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":["Ashura","Urs of Shaykh Shamsuddin Habīb Allah ق","Urs of Shaykh Abū al‑Hassan al‑Kharqāni ق","Birth of Imam Rābbani Ahmad Al-Fāruqi As-Sirhindi ق"],"adjustedHolidays":[],"method":"HJCoSA"},"gregorian":{"date":"16-07-2024","format":"DD-MM-YYYY","day":"16","weekday":{"en":"Tuesday"},"month":{"number":7,"en":"July"},"year":"2024","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}}
/// meta : {"latitude":8.8888888,"longitude":7.7777777,"timezone":"Africa/Cairo","method":{"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}},"latitudeAdjustmentMethod":"ANGLE_BASED","midnightMode":"STANDARD","school":"STANDARD","offset":{"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}}

class Data {
  Data({
      this.timings, 
      this.date, 
      this.meta,});

  Data.fromJson(dynamic json) {
    timings = json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  Timings? timings;
  Date? date;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (timings != null) {
      map['timings'] = timings?.toJson();
    }
    if (date != null) {
      map['date'] = date?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}

/// latitude : 8.8888888
/// longitude : 7.7777777
/// timezone : "Africa/Cairo"
/// method : {"id":5,"name":"Egyptian General Authority of Survey","params":{"Fajr":19.5,"Isha":17.5},"location":{"latitude":30.0444196,"longitude":31.2357116}}
/// latitudeAdjustmentMethod : "ANGLE_BASED"
/// midnightMode : "STANDARD"
/// school : "STANDARD"
/// offset : {"Imsak":0,"Fajr":0,"Sunrise":0,"Dhuhr":0,"Asr":0,"Maghrib":0,"Sunset":0,"Isha":0,"Midnight":0}

class Meta {
  Meta({
      this.latitude, 
      this.longitude, 
      this.timezone, 
      this.method, 
      this.latitudeAdjustmentMethod, 
      this.midnightMode, 
      this.school, 
      this.offset,});

  Meta.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    method = json['method'] != null ? Method.fromJson(json['method']) : null;
    latitudeAdjustmentMethod = json['latitudeAdjustmentMethod'];
    midnightMode = json['midnightMode'];
    school = json['school'];
    offset = json['offset'] != null ? Offset.fromJson(json['offset']) : null;
  }
  num? latitude;
  num? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['timezone'] = timezone;
    if (method != null) {
      map['method'] = method?.toJson();
    }
    map['latitudeAdjustmentMethod'] = latitudeAdjustmentMethod;
    map['midnightMode'] = midnightMode;
    map['school'] = school;
    if (offset != null) {
      map['offset'] = offset?.toJson();
    }
    return map;
  }

}

/// Imsak : 0
/// Fajr : 0
/// Sunrise : 0
/// Dhuhr : 0
/// Asr : 0
/// Maghrib : 0
/// Sunset : 0
/// Isha : 0
/// Midnight : 0

class Offset {
  Offset({
      this.imsak, 
      this.fajr, 
      this.sunrise, 
      this.dhuhr, 
      this.asr, 
      this.maghrib, 
      this.sunset, 
      this.isha, 
      this.midnight,});

  Offset.fromJson(dynamic json) {
    imsak = json['Imsak'];
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    sunset = json['Sunset'];
    isha = json['Isha'];
    midnight = json['Midnight'];
  }
  num? imsak;
  num? fajr;
  num? sunrise;
  num? dhuhr;
  num? asr;
  num? maghrib;
  num? sunset;
  num? isha;
  num? midnight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Imsak'] = imsak;
    map['Fajr'] = fajr;
    map['Sunrise'] = sunrise;
    map['Dhuhr'] = dhuhr;
    map['Asr'] = asr;
    map['Maghrib'] = maghrib;
    map['Sunset'] = sunset;
    map['Isha'] = isha;
    map['Midnight'] = midnight;
    return map;
  }

}

/// id : 5
/// name : "Egyptian General Authority of Survey"
/// params : {"Fajr":19.5,"Isha":17.5}
/// location : {"latitude":30.0444196,"longitude":31.2357116}

class Method {
  Method({
      this.id, 
      this.name, 
      this.params, 
      this.location,});

  Method.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    params = json['params'] != null ? Params.fromJson(json['params']) : null;
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  num? id;
  String? name;
  Params? params;
  Location? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (params != null) {
      map['params'] = params?.toJson();
    }
    if (location != null) {
      map['location'] = location?.toJson();
    }
    return map;
  }

}

/// latitude : 30.0444196
/// longitude : 31.2357116

class Location {
  Location({
      this.latitude, 
      this.longitude,});

  Location.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  num? latitude;
  num? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}

/// Fajr : 19.5
/// Isha : 17.5

class Params {
  Params({
      this.fajr, 
      this.isha,});

  Params.fromJson(dynamic json) {
    fajr = json['Fajr'];
    isha = json['Isha'];
  }
  num? fajr;
  num? isha;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fajr'] = fajr;
    map['Isha'] = isha;
    return map;
  }

}

/// readable : "16 Jul 2024"
/// timestamp : "1721102400"
/// hijri : {"date":"10-01-1446","format":"DD-MM-YYYY","day":"10","weekday":{"en":"Al Thalaata","ar":"الثلاثاء"},"month":{"number":1,"en":"Muḥarram","ar":"مُحَرَّم","days":29},"year":"1446","designation":{"abbreviated":"AH","expanded":"Anno Hegirae"},"holidays":["Ashura","Urs of Shaykh Shamsuddin Habīb Allah ق","Urs of Shaykh Abū al‑Hassan al‑Kharqāni ق","Birth of Imam Rābbani Ahmad Al-Fāruqi As-Sirhindi ق"],"adjustedHolidays":[],"method":"HJCoSA"}
/// gregorian : {"date":"16-07-2024","format":"DD-MM-YYYY","day":"16","weekday":{"en":"Tuesday"},"month":{"number":7,"en":"July"},"year":"2024","designation":{"abbreviated":"AD","expanded":"Anno Domini"},"lunarSighting":false}

class Date {
  Date({
      this.readable, 
      this.timestamp, 
      this.hijri, 
      this.gregorian,});

  Date.fromJson(dynamic json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null ? Gregorian.fromJson(json['gregorian']) : null;
  }
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['readable'] = readable;
    map['timestamp'] = timestamp;
    if (hijri != null) {
      map['hijri'] = hijri?.toJson();
    }
    if (gregorian != null) {
      map['gregorian'] = gregorian?.toJson();
    }
    return map;
  }

}

/// date : "16-07-2024"
/// format : "DD-MM-YYYY"
/// day : "16"
/// weekday : {"en":"Tuesday"}
/// month : {"number":7,"en":"July"}
/// year : "2024"
/// designation : {"abbreviated":"AD","expanded":"Anno Domini"}
/// lunarSighting : false

class Gregorian {
  Gregorian({
      this.date, 
      this.format, 
      this.day, 
      this.weekday, 
      this.month, 
      this.year, 
      this.designation, 
      this.lunarSighting,});

  Gregorian.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null ? Designation.fromJson(json['designation']) : null;
    lunarSighting = json['lunarSighting'];
  }
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  bool? lunarSighting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['format'] = format;
    map['day'] = day;
    if (weekday != null) {
      map['weekday'] = weekday?.toJson();
    }
    if (month != null) {
      map['month'] = month?.toJson();
    }
    map['year'] = year;
    if (designation != null) {
      map['designation'] = designation?.toJson();
    }
    map['lunarSighting'] = lunarSighting;
    return map;
  }

}

/// abbreviated : "AD"
/// expanded : "Anno Domini"

class Designation {
  Designation({
      this.abbreviated, 
      this.expanded,});

  Designation.fromJson(dynamic json) {
    abbreviated = json['abbreviated'];
    expanded = json['expanded'];
  }
  String? abbreviated;
  String? expanded;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['abbreviated'] = abbreviated;
    map['expanded'] = expanded;
    return map;
  }

}

/// number : 7
/// en : "July"

class Month {
  Month({
      this.number, 
      this.en,});

  Month.fromJson(dynamic json) {
    number = json['number'];
    en = json['en'];
  }
  num? number;
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['en'] = en;
    return map;
  }

}

/// en : "Tuesday"

class Weekday {
  Weekday({
      this.en,});

  Weekday.fromJson(dynamic json) {
    en = json['en'];
  }
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    return map;
  }

}

/// date : "10-01-1446"
/// format : "DD-MM-YYYY"
/// day : "10"
/// weekday : {"en":"Al Thalaata","ar":"الثلاثاء"}
/// month : {"number":1,"en":"Muḥarram","ar":"مُحَرَّم","days":29}
/// year : "1446"
/// designation : {"abbreviated":"AH","expanded":"Anno Hegirae"}
/// holidays : ["Ashura","Urs of Shaykh Shamsuddin Habīb Allah ق","Urs of Shaykh Abū al‑Hassan al‑Kharqāni ق","Birth of Imam Rābbani Ahmad Al-Fāruqi As-Sirhindi ق"]
/// adjustedHolidays : []
/// method : "HJCoSA"

class Hijri {
  Hijri({
      this.date, 
      this.format, 
      this.day, 
      this.weekday, 
      this.month, 
      this.year, 
      this.designation, 
      this.holidays, 
      this.adjustedHolidays, 
      this.method,});

  Hijri.fromJson(dynamic json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday = json['weekday'] != null ? Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? Month.fromJson(json['month']) : null;
    year = json['year'];
    designation = json['designation'] != null ? Designation.fromJson(json['designation']) : null;
    holidays = json['holidays'] != null ? json['holidays'].cast<String>() : [];
    if (json['adjustedHolidays'] != null) {
      adjustedHolidays = [];
      json['adjustedHolidays'].forEach((v) {
        adjustedHolidays?.add( dynamic.fromJson(v));
      });
    }
    method = json['method'];
  }
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<String>? holidays;
  List<dynamic>? adjustedHolidays;
  String? method;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['format'] = format;
    map['day'] = day;
    if (weekday != null) {
      map['weekday'] = weekday?.toJson();
    }
    if (month != null) {
      map['month'] = month?.toJson();
    }
    map['year'] = year;
    if (designation != null) {
      map['designation'] = designation?.toJson();
    }
    map['holidays'] = holidays;
    if (adjustedHolidays != null) {
      map['adjustedHolidays'] = adjustedHolidays?.map((v) => v.toJson()).toList();
    }
    map['method'] = method;
    return map;
  }

}

extension on Type {
  fromJson(v) {}
}

/// abbreviated : "AH"
/// expanded : "Anno Hegirae"



/// number : 1
/// en : "Muḥarram"
/// ar : "مُحَرَّم"
/// days : 29



/// en : "Al Thalaata"
/// ar : "الثلاثاء"


/// Fajr : "04:22"
/// Sunrise : "06:04"
/// Dhuhr : "13:01"
/// Asr : "16:38"
/// Sunset : "19:57"
/// Maghrib : "19:57"
/// Isha : "21:28"
/// Imsak : "04:12"
/// Midnight : "01:01"
/// Firstthird : "23:20"
/// Lastthird : "02:42"

class Timings {
  Timings({
      this.fajr, 
      this.sunrise, 
      this.dhuhr, 
      this.asr, 
      this.sunset, 
      this.maghrib, 
      this.isha, 
      this.imsak, 
      this.midnight, 
      this.firstthird, 
      this.lastthird,});

  Timings.fromJson(dynamic json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
    firstthird = json['Firstthird'];
    lastthird = json['Lastthird'];
  }
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fajr'] = fajr;
    map['Sunrise'] = sunrise;
    map['Dhuhr'] = dhuhr;
    map['Asr'] = asr;
    map['Sunset'] = sunset;
    map['Maghrib'] = maghrib;
    map['Isha'] = isha;
    map['Imsak'] = imsak;
    map['Midnight'] = midnight;
    map['Firstthird'] = firstthird;
    map['Lastthird'] = lastthird;
    return map;
  }

}
import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.aqi,
    this.idx,
    this.attributions,
    this.city,
    this.dominentpol,
    this.iaqi,
    this.time,
    this.forecast,
    this.debug,
  });

  int? aqi;
  int? idx;
  List<Attribution>? attributions;
  City? city;
  String? dominentpol;
  Iaqi? iaqi;
  Time? time;
  Forecast? forecast;
  Debug? debug;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aqi: json["aqi"],
        idx: json["idx"],
        attributions: json["attributions"] == null
            ? []
            : List<Attribution>.from(
                json["attributions"]!.map((x) => Attribution.fromJson(x))),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        dominentpol: json["dominentpol"],
        iaqi: json["iaqi"] == null ? null : Iaqi.fromJson(json["iaqi"]),
        time: json["time"] == null ? null : Time.fromJson(json["time"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
        debug: json["debug"] == null ? null : Debug.fromJson(json["debug"]),
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "idx": idx,
        "attributions": attributions == null
            ? []
            : List<dynamic>.from(attributions!.map((x) => x.toJson())),
        "city": city?.toJson(),
        "dominentpol": dominentpol,
        "iaqi": iaqi?.toJson(),
        "time": time?.toJson(),
        "forecast": forecast?.toJson(),
        "debug": debug?.toJson(),
      };
}

class Attribution {
  Attribution({
    this.url,
    this.name,
  });

  String? url;
  String? name;

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        url: json["url"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
      };
}

class City {
  City({
    this.geo,
    this.name,
    this.url,
    this.location,
  });

  List<double>? geo;
  String? name;
  String? url;
  String? location;

  factory City.fromJson(Map<String, dynamic> json) => City(
        geo: json["geo"] == null
            ? []
            : List<double>.from(json["geo"]!.map((x) => x?.toDouble())),
        name: json["name"],
        url: json["url"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "geo": geo == null ? [] : List<dynamic>.from(geo!.map((x) => x)),
        "name": name,
        "url": url,
        "location": location,
      };
}

class Debug {
  Debug({
    this.sync,
  });

  DateTime? sync;

  factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        sync: json["sync"] == null ? null : DateTime.parse(json["sync"]),
      );

  Map<String, dynamic> toJson() => {
        "sync": sync?.toIso8601String(),
      };
}

class Forecast {
  Forecast({
    this.daily,
  });

  Daily? daily;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "daily": daily?.toJson(),
      };
}

class Daily {
  Daily({
    this.o3,
    this.pm10,
    this.pm25,
    this.uvi,
  });

  List<O3>? o3;
  List<O3>? pm10;
  List<O3>? pm25;
  List<O3>? uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        o3: json["o3"] == null
            ? []
            : List<O3>.from(json["o3"]!.map((x) => O3.fromJson(x))),
        pm10: json["pm10"] == null
            ? []
            : List<O3>.from(json["pm10"]!.map((x) => O3.fromJson(x))),
        pm25: json["pm25"] == null
            ? []
            : List<O3>.from(json["pm25"]!.map((x) => O3.fromJson(x))),
        uvi: json["uvi"] == null
            ? []
            : List<O3>.from(json["uvi"]!.map((x) => O3.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "o3": o3 == null ? [] : List<dynamic>.from(o3!.map((x) => x.toJson())),
        "pm10": pm10 == null
            ? []
            : List<dynamic>.from(pm10!.map((x) => x.toJson())),
        "pm25": pm25 == null
            ? []
            : List<dynamic>.from(pm25!.map((x) => x.toJson())),
        "uvi":
            uvi == null ? [] : List<dynamic>.from(uvi!.map((x) => x.toJson())),
      };
}

class O3 {
  O3({
    this.avg,
    this.day,
    this.max,
    this.min,
  });

  int? avg;
  DateTime? day;
  int? max;
  int? min;

  factory O3.fromJson(Map<String, dynamic> json) => O3(
        avg: json["avg"],
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        max: json["max"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "avg": avg,
        "day":
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "max": max,
        "min": min,
      };
}

class Iaqi {
  Iaqi({
    this.co,
    this.h,
    this.no2,
    this.o3,
    this.p,
    this.pm10,
    this.pm25,
    this.so2,
    this.t,
    this.w,
  });

  Co? co;
  Co? h;
  Co? no2;
  Co? o3;
  Co? p;
  Co? pm10;
  Co? pm25;
  Co? so2;
  Co? t;
  Co? w;

  factory Iaqi.fromJson(Map<String, dynamic> json) => Iaqi(
        co: json["co"] == null ? null : Co.fromJson(json["co"]),
        h: json["h"] == null ? null : Co.fromJson(json["h"]),
        no2: json["no2"] == null ? null : Co.fromJson(json["no2"]),
        o3: json["o3"] == null ? null : Co.fromJson(json["o3"]),
        p: json["p"] == null ? null : Co.fromJson(json["p"]),
        pm10: json["pm10"] == null ? null : Co.fromJson(json["pm10"]),
        pm25: json["pm25"] == null ? null : Co.fromJson(json["pm25"]),
        so2: json["so2"] == null ? null : Co.fromJson(json["so2"]),
        t: json["t"] == null ? null : Co.fromJson(json["t"]),
        w: json["w"] == null ? null : Co.fromJson(json["w"]),
      );

  Map<String, dynamic> toJson() => {
        "co": co?.toJson(),
        "h": h?.toJson(),
        "no2": no2?.toJson(),
        "o3": o3?.toJson(),
        "p": p?.toJson(),
        "pm10": pm10?.toJson(),
        "pm25": pm25?.toJson(),
        "so2": so2?.toJson(),
        "t": t?.toJson(),
        "w": w?.toJson(),
      };
}

class Co {
  Co({
    this.v,
  });

  double? v;

  factory Co.fromJson(Map<String, dynamic> json) => Co(
        v: json["v"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "v": v,
      };
}

class Time {
  Time({
    this.s,
    this.tz,
    this.v,
    this.iso,
  });

  DateTime? s;
  String? tz;
  int? v;
  DateTime? iso;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        s: json["s"] == null ? null : DateTime.parse(json["s"]),
        tz: json["tz"],
        v: json["v"],
        iso: json["iso"] == null ? null : DateTime.parse(json["iso"]),
      );

  Map<String, dynamic> toJson() => {
        "s": s?.toIso8601String(),
        "tz": tz,
        "v": v,
        "iso": iso?.toIso8601String(),
      };
}

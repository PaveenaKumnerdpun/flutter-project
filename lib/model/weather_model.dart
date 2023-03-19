// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.aqi,
    required this.idx,
    required this.attributions,
    required this.city,
    required this.dominentpol,
    required this.iaqi,
    required this.time,
    required this.forecast,
    required this.debug,
  });

  int aqi;
  int idx;
  List<Attribution> attributions;
  City city;
  String dominentpol;
  Iaqi iaqi;
  Time time;
  Forecast forecast;
  Debug debug;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aqi: json["aqi"],
        idx: json["idx"],
        attributions: List<Attribution>.from(
            json["attributions"].map((x) => Attribution.fromJson(x))),
        city: City.fromJson(json["city"]),
        dominentpol: json["dominentpol"],
        iaqi: Iaqi.fromJson(json["iaqi"]),
        time: Time.fromJson(json["time"]),
        forecast: Forecast.fromJson(json["forecast"]),
        debug: Debug.fromJson(json["debug"]),
      );

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "idx": idx,
        "attributions": List<dynamic>.from(attributions.map((x) => x.toJson())),
        "city": city.toJson(),
        "dominentpol": dominentpol,
        "iaqi": iaqi.toJson(),
        "time": time.toJson(),
        "forecast": forecast.toJson(),
        "debug": debug.toJson(),
      };
}

class Attribution {
  Attribution({
    required this.url,
    required this.name,
    this.logo,
  });

  String url;
  String name;
  String? logo;

  factory Attribution.fromJson(Map<String, dynamic> json) => Attribution(
        url: json["url"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "logo": logo,
      };
}

class City {
  City({
    required this.geo,
    required this.name,
    required this.url,
    required this.location,
  });

  List<double> geo;
  String name;
  String url;
  String location;

  factory City.fromJson(Map<String, dynamic> json) => City(
        geo: List<double>.from(json["geo"].map((x) => x?.toDouble())),
        name: json["name"],
        url: json["url"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "geo": List<dynamic>.from(geo.map((x) => x)),
        "name": name,
        "url": url,
        "location": location,
      };
}

class Debug {
  Debug({
    required this.sync,
  });

  DateTime sync;

  factory Debug.fromJson(Map<String, dynamic> json) => Debug(
        sync: DateTime.parse(json["sync"]),
      );

  Map<String, dynamic> toJson() => {
        "sync": sync.toIso8601String(),
      };
}

class Forecast {
  Forecast({
    required this.daily,
  });

  Daily daily;

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        daily: Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "daily": daily.toJson(),
      };
}

class Daily {
  Daily({
    required this.o3,
    required this.pm10,
    required this.pm25,
    required this.uvi,
  });

  List<O3> o3;
  List<O3> pm10;
  List<O3> pm25;
  List<O3> uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        o3: List<O3>.from(json["o3"].map((x) => O3.fromJson(x))),
        pm10: List<O3>.from(json["pm10"].map((x) => O3.fromJson(x))),
        pm25: List<O3>.from(json["pm25"].map((x) => O3.fromJson(x))),
        uvi: List<O3>.from(json["uvi"].map((x) => O3.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "o3": List<dynamic>.from(o3.map((x) => x.toJson())),
        "pm10": List<dynamic>.from(pm10.map((x) => x.toJson())),
        "pm25": List<dynamic>.from(pm25.map((x) => x.toJson())),
        "uvi": List<dynamic>.from(uvi.map((x) => x.toJson())),
      };
}

class O3 {
  O3({
    required this.avg,
    required this.day,
    required this.max,
    required this.min,
  });

  int avg;
  DateTime day;
  int max;
  int min;

  factory O3.fromJson(Map<String, dynamic> json) => O3(
        avg: json["avg"],
        day: DateTime.parse(json["day"]),
        max: json["max"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "avg": avg,
        "day":
            "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "max": max,
        "min": min,
      };
}

class Iaqi {
  Iaqi({
    required this.co,
    required this.h,
    required this.no2,
    required this.o3,
    required this.p,
    required this.pm10,
    required this.pm25,
    required this.so2,
    required this.t,
    required this.w,
  });

  Co co;
  Co h;
  Co no2;
  Co o3;
  Co p;
  Co pm10;
  Co pm25;
  Co so2;
  Co t;
  Co w;

  factory Iaqi.fromJson(Map<String, dynamic> json) => Iaqi(
        co: Co.fromJson(json["co"]),
        h: Co.fromJson(json["h"]),
        no2: Co.fromJson(json["no2"]),
        o3: Co.fromJson(json["o3"]),
        p: Co.fromJson(json["p"]),
        pm10: Co.fromJson(json["pm10"]),
        pm25: Co.fromJson(json["pm25"]),
        so2: Co.fromJson(json["so2"]),
        t: Co.fromJson(json["t"]),
        w: Co.fromJson(json["w"]),
      );

  Map<String, dynamic> toJson() => {
        "co": co.toJson(),
        "h": h.toJson(),
        "no2": no2.toJson(),
        "o3": o3.toJson(),
        "p": p.toJson(),
        "pm10": pm10.toJson(),
        "pm25": pm25.toJson(),
        "so2": so2.toJson(),
        "t": t.toJson(),
        "w": w.toJson(),
      };
}

class Co {
  Co({
    required this.v,
  });

  double v;

  factory Co.fromJson(Map<String, dynamic> json) => Co(
        v: json["v"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "v": v,
      };
}

class Time {
  Time({
    required this.s,
    required this.tz,
    required this.v,
    required this.iso,
  });

  DateTime s;
  String tz;
  int v;
  DateTime iso;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        s: DateTime.parse(json["s"]),
        tz: json["tz"],
        v: json["v"],
        iso: DateTime.parse(json["iso"]),
      );

  Map<String, dynamic> toJson() => {
        "s": s.toIso8601String(),
        "tz": tz,
        "v": v,
        "iso": iso.toIso8601String(),
      };
}

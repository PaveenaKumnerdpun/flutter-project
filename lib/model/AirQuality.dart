// To parse this JSON data, do
//
//     final airQuality = airQualityFromJson(jsonString);

import 'dart:convert';

AirQuality airQualityFromJson(String str) =>
    AirQuality.fromJson(json.decode(str));

String airQualityToJson(AirQuality data) => json.encode(data.toJson());

class AirQuality {
  AirQuality({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory AirQuality.fromJson(Map<String, dynamic> json) => AirQuality(
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
    required this.city,
    required this.state,
    required this.country,
    required this.location,
    required this.current,
  });

  String city;
  String state;
  String country;
  Location location;
  Current current;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        city: json["city"],
        state: json["state"],
        country: json["country"],
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "country": country,
        "location": location.toJson(),
        "current": current.toJson(),
      };
}

class Current {
  Current({
    required this.pollution,
    required this.weather,
  });

  Pollution pollution;
  Weather weather;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        pollution: Pollution.fromJson(json["pollution"]),
        weather: Weather.fromJson(json["weather"]),
      );

  Map<String, dynamic> toJson() => {
        "pollution": pollution.toJson(),
        "weather": weather.toJson(),
      };
}

class Pollution {
  Pollution({
    required this.ts,
    required this.aqius,
    required this.mainus,
    required this.aqicn,
    required this.maincn,
  });

  DateTime ts;
  int aqius;
  String mainus;
  int aqicn;
  String maincn;

  factory Pollution.fromJson(Map<String, dynamic> json) => Pollution(
        ts: DateTime.parse(json["ts"]),
        aqius: json["aqius"],
        mainus: json["mainus"],
        aqicn: json["aqicn"],
        maincn: json["maincn"],
      );

  Map<String, dynamic> toJson() => {
        "ts": ts.toIso8601String(),
        "aqius": aqius,
        "mainus": mainus,
        "aqicn": aqicn,
        "maincn": maincn,
      };
}

class Weather {
  Weather({
    required this.ts,
    required this.tp,
    required this.pr,
    required this.hu,
    required this.ws,
    required this.wd,
    required this.ic,
  });

  DateTime ts;
  int tp;
  int pr;
  int hu;
  double ws;
  int wd;
  String ic;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        ts: DateTime.parse(json["ts"]),
        tp: json["tp"],
        pr: json["pr"],
        hu: json["hu"],
        ws: json["ws"]?.toDouble(),
        wd: json["wd"],
        ic: json["ic"],
      );

  Map<String, dynamic> toJson() => {
        "ts": ts.toIso8601String(),
        "tp": tp,
        "pr": pr,
        "hu": hu,
        "ws": ws,
        "wd": wd,
        "ic": ic,
      };
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

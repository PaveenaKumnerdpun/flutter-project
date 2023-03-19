import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../model/weather_model.dart';

Future<Weather> fetchData(String city) async {
  log(city);
  final Response res = await http.get(Uri.parse(
      "https://api.waqi.info/feed/$city/?token=a5fd914d6761548a8f3e949c6ca436846ea0fb33"));

  final Weather weather = weatherFromJson(res.body);
  return weather;
}

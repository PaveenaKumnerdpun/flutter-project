import 'package:flutter/material.dart';
import 'package:flutter_project/model/weather_model.dart';
import 'package:flutter_project/service/weather_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Weather? _weather;

  final _ctrCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const Icon(Icons.menu),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.person),
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            // City
            TextField(
              controller: _ctrCity,
              decoration: const InputDecoration(
                hintText: "City",
              ),
            ),

            IconButton(
              onPressed: () async {
                _weather = await fetchData(
                  _ctrCity.text,
                );
                setState(() {});
              },
              icon: const Icon(Icons.search),
            ),

            const SizedBox(height: 25),
            Text("City: ${_weather?.data?.city?.name ?? "NULL"}"),
            Text("Date: ${_weather?.data?.time?.tz ?? "NULL"}"),
            Text("City Geo: ${_weather?.data?.city?.geo ?? "NULL"}"),
            Text(
                "Individual AQI for the PM2.5: ${_weather?.data?.iaqi?.pm25?.v ?? "NULL"}"),
            Text(
                "Average PM2.5 Forcast: ${_weather?.data?.forecast?.daily?.pm25?[0].avg ?? "NULL"}"),
            Text(
                "Average PM2.5 Forcast: ${_weather?.data?.forecast?.daily?.pm25?[1].avg ?? "NULL"}"),
            Text(
                "Average PM10 Forcast: ${_weather?.data?.forecast?.daily?.pm10?[0].avg ?? "NULL"}"),
            Text(
                "Average PM10 Forcast: ${_weather?.data?.forecast?.daily?.pm10?[1].avg ?? "NULL"}"),
          ]),
        ));
  }
}

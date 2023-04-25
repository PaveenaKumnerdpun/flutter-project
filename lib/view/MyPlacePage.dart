import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../model/AirQuality.dart';
import 'BottomNav.dart';

class MyPlacePage extends StatefulWidget {
  const MyPlacePage({super.key});

  @override
  State<MyPlacePage> createState() => _MyPlacePageState();
}

class _MyPlacePageState extends State<MyPlacePage> {
  Position? _currentPosition;
  AirQuality? _airQualityData;
  bool _isLoading = false;
  String? level;

  Future<AirQuality> _fetchAirQualityData(
      double latitude, double longitude) async {
    const apiKey =
        'd2b74894-45f9-4037-891e-5a3bc503c687'; // Replace this with your actual API key
    final url =
        'http://api.airvisual.com/v2/nearest_city?lat=$latitude&lon=$longitude&key=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final airQuality = airQualityFromJson(response.body);
      return airQuality;
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    setState(() {
      _isLoading = true; // set isLoading to true when fetching data
    });
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      final airQualityData =
          await _fetchAirQualityData(position.latitude, position.longitude);
      setState(() {
        _currentPosition = position;
        _airQualityData = airQualityData;
        level = _getAqiLevel(airQualityData.data.current.pollution.aqius);
        _isLoading = false; // set isLoading to false when data is fetched
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  String _getAqiLevel(int aqi) {
    if (aqi <= 50) {
      return 'Good';
    } else if (aqi <= 100) {
      return 'Moderate';
    } else if (aqi <= 150) {
      return 'Unhealthy for Sensitive Groups';
    } else if (aqi <= 200) {
      return 'Unhealthy';
    } else if (aqi <= 300) {
      return 'Very Unhealthy';
    } else {
      return 'Hazardous';
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Place"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 32,
          ),
          if (_isLoading)
            const Text('Loading...', style: TextStyle(fontSize: 30))
          else
            Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 32),
                    if (_airQualityData != null)
                      SizedBox(
                        width: 350,
                        child: Card(
                          color: Colors.blueGrey[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _airQualityData!.data.city,
                                  style: const TextStyle(fontSize: 40),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                    '${_airQualityData!.data.state}, ${_airQualityData!.data.country}',
                                    style: const TextStyle(fontSize: 20)),
                              ),
                              const SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'AQI: ${_airQualityData!.data.current.pollution.aqius}',
                                    style: const TextStyle(fontSize: 50)),
                              ),
                              const SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Quality: $level',
                                    style: const TextStyle(fontSize: 30)),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Text(
                        'Last Updated: ${_airQualityData?.data.current.pollution.ts}',
                        style: const TextStyle(fontSize: 15)),
                    Text('Latitude: ${_currentPosition?.latitude ?? ""}',
                        style: const TextStyle(fontSize: 15)),
                    Text('Longitude: ${_currentPosition?.longitude ?? ""}',
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _getCurrentPosition,
            child: const Text("Refresh"),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/SearchPage');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/ProfilePage');
          }
        },
      ),
    );
  }
}

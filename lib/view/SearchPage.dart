import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../model/CustomLogPrinter.dart';
import 'BottomNav.dart';

const apiKey = 'd2b74894-45f9-4037-891e-5a3bc503c687';
const country = 'Thailand';

final logger = (Type type) => Logger(
      printer: CustomLogPrinter(type.toString()),
    );

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedState;
  String? _selectedCity;
  final List<String> _states = [
    "Amnat Charoen",
    "Ang Thong",
    "Bangkok",
    "Buriram",
    "Chachoengsao",
    "Chai Nat",
    "Chaiyaphum",
    "Changwat Bueng Kan",
    "Changwat Ubon Ratchathani",
    "Changwat Udon Thani",
    "Chanthaburi",
    "Chiang Mai",
    "Chiang Rai",
    "Chon Buri",
    "Chumphon",
    "Kalasin",
    "Kamphaeng Phet",
    "Kanchanaburi",
    "Khon Kaen",
    "Krabi",
    "Lampang",
    "Lamphun",
    "Loei",
    "Lop Buri",
    "Mae Hong Son",
    "Maha Sarakham",
    "Mukdahan",
    "Nakhon Nayok",
    "Nakhon Pathom",
    "Nakhon Phanom",
    "Nakhon Ratchasima",
    "Nakhon Sawan",
    "Nakhon Si Thammarat",
    "Nan",
    "Narathiwat",
    "Nong Bua Lamphu",
    "Nong Khai",
    "Nonthaburi",
    "Pathum Thani",
    "Pattani",
    "Phangnga",
    "Phatthalung",
    "Phayao",
    "Phetchabun",
    "Phetchaburi",
    "Phichit",
    "Phitsanulok",
    "Phra Nakhon Si Ayutthaya",
    "Phrae",
    "Phuket",
    "Prachin Buri",
    "Prachuap Khiri Khan",
    "Ranong",
    "Ratchaburi",
    "Rayong",
    "Roi Et",
    "Sa Kaeo",
    "Sakon Nakhon",
    "Samut Prakan",
    "Samut Sakhon",
    "Samut Songkhram",
    "Sara Buri",
    "Satun",
    "Sing Buri",
    "Sisaket",
    "Songkhla",
    "Sukhothai",
    "Suphan Buri",
    "Surat Thani",
    "Surin",
    "Tak",
    "Trang",
    "Trat",
    "Uthai Thani",
    "Uttaradit",
    "Yala",
    "Yasothon"
  ];
  List<String> _cities = [];

  Future<void> _getCities() async {
    final response = await http.get(Uri.parse(
        'http://api.airvisual.com/v2/cities?state=$_selectedState&country=$country&key=$apiKey'));

    final data = jsonDecode(response.body);
    if (data['status'] == "success") {
      final List<dynamic> cities = data['data'];

      setState(() {
        _cities = cities.map((city) => city['city']).cast<String>().toList();
        _selectedCity = null;
      });
    }
  }

  Future<void> _getAirQualityData() async {
    final response = await http.get(Uri.parse(
        'http://api.airvisual.com/v2/city?city=$_selectedCity&state=$_selectedState&country=$country&key=$apiKey'));

    final data = jsonDecode(response.body);
    if (data != null) {
      final Map<String, dynamic> current = data['data']['current'];
      final String cityName = data['data']['city'];

      final double aqi = current['pollution']['aqius'].toDouble();
      final String level = _getAqiLevel(aqi);
      final String datetime =
          "${current['pollution']['ts'].toString().substring(0, 10)} ${current['pollution']['ts'].toString().substring(11, 16)}";

      alertData(cityName, aqi, level, datetime);
    }
  }

  Future<dynamic> alertData(
      String cityName, double aqi, String level, String datetime) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(cityName, style: const TextStyle(fontSize: 26)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                'AQI: $aqi',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Quality: $level', style: const TextStyle(fontSize: 22)),
              const SizedBox(
                height: 15,
              ),
              Text('Updated: $datetime', style: const TextStyle(fontSize: 15))
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String _getAqiLevel(double aqi) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Location'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: DropdownButton<String>(
              isExpanded: true,
              hint: const Text('Select a state'),
              value: _selectedState,
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                  _selectedCity = null;
                  _cities = [];
                });
                _getCities();
              },
              items: _states.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Visibility(
              visible: _cities.isNotEmpty,
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedCity,
                items: _cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
                hint: const Text('Select a city'),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[400], // Background color
              ),
              onPressed: () {
                logger(SearchPage).i('Click Search Button');
                if (_selectedState != null && _selectedCity != null) {
                  _getAirQualityData();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('The data of this state is not available.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: const Text('Search', style: TextStyle(fontSize: 18)),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[400], // Background color
              ),
              onPressed: () {
                logger(SearchPage).i('Click Clear Button');
                setState(() {
                  _selectedState = null;
                  _selectedCity = null;
                  _cities = [];
                });
              },
              child: const Text('Clear', style: TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 1,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/CurrentLocationPage');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/ProfilePage');
          }
        },
      ),
    );
  }
}

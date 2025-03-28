import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/search_page.dart';
import 'config.dart';
import 'services/openweathermap_api.dart';

void main() {
  runApp(
    const WeatherApp(),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => OpenWeatherMapApi(apiKey: openWeatherMapApiKey),
        child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData.dark(),
          home: const SearchPage(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app/services/openweathermap_api.dart';
import 'package:weather_app/config.dart';
import 'dart:developer';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  OpenWeatherMapApi openWeatherMapApi =
      new OpenWeatherMapApi(apiKey: openWeatherMapApiKey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
      ),
      body: Column(children: [
        TextField(
          onChanged: (String value) {
            this.query = value;
            log(value);
          },
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Entrer')),
        FutureBuilder(
          future: openWeatherMapApi.searchLocations(query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Une erreur est survenue.\n${snapshot.error}');
            }

            if (!snapshot.hasData) {
              return const Text('Aucun résultat pour cette recherche.');
            }

            return Column();
          },
        ),
      ]),
    );
  }
}

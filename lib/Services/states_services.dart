import 'dart:convert';

import 'package:flutter_covid_19_tracking_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/WorldStatesModel.dart';

class StatesServices {
  static Future<WorldStatesModel> fetchworldStatesData() async {
    final response = await http.get(Uri.parse(APPUrl.allEndpoint));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  static Future<List<dynamic>> fetchCountriesStatesData() async {
    var data;
    final response = await http.get(Uri.parse(APPUrl.countriesListEndpoint));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}

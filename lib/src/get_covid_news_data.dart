import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import 'models/covid_data.dart';

Future<CovidData> getCovidNewsData(String baseUrl, String newsNumber) async {
  // try {
    final response = await Dio().get('$baseUrl$newsNumber');
    return CovidData.fromDocument(newsNumber, parse(response.data));
  // } catch(e) {
  //   throw e.toString();
  // }
}
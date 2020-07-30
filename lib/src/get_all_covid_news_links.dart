import 'package:dio/dio.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

Future<List<String>> getAllCovidNewsLinks(String link) async {
  try {
    final response = await Dio().get(link);

    // Parse the html
    final document = parse(response.data);
    final List<Element> allNewsElements = document.body.children..removeAt(0);

    return allNewsElements
      .map<String>((el) => el.attributes['onclick'].replaceFirst('javascript:document.location="/noticia/', '').replaceFirst('"', ''))
      .toList();
  } catch(e) {
    throw e.toString();
  }
}
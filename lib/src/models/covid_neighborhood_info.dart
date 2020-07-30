

import 'package:html/dom.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/utils/patterns.dart';

class CovidNeighborhoodInfo {

  String neighborhoodName;
  int cases;
  
  // Casos liberados
  int releasedCases;
  int quarantineCases;
  int deaths;

  CovidNeighborhoodInfo.fromElement(Element el) {
    neighborhoodName = el.children[0].text.trim().replaceAll(spacesPattern, ' ');
    cases = int.tryParse(el.children[1].text.trim());
    releasedCases = int.tryParse(el.children[2].text.trim());
    quarantineCases = int.tryParse(el.children[3].text.trim());
    deaths = int.tryParse(el.children[4].text.trim());
  }

  String toString() {
    return '$neighborhoodName $cases $releasedCases $quarantineCases $deaths';
  }

  String toCSVString() {
    return '$neighborhoodName,$cases,$releasedCases,$quarantineCases,$deaths';
  }

}
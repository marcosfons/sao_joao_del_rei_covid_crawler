

import 'package:html/dom.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/utils/patterns.dart';

class CovidTestInfo {

  String testName;

  // Realizados
  int realized;
  int positive;
  int negative;

  CovidTestInfo.fromElement(Element nameEl, List<Element> dataEl) {
    testName = nameEl.text.trim().replaceAll(spacesPattern, ' ');
    realized = int.tryParse(dataEl[0].text.trim());
    positive = int.tryParse(dataEl[1].text.trim());
    negative = int.tryParse(dataEl[2].text.trim());
  }

  String toString() {
    return '$testName $realized $positive $negative';
  }

  String toCSVString() {
    return '$testName,$realized,$positive,$negative';
  }

}
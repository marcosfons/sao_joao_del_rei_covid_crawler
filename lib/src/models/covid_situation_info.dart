import 'package:html/dom.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/utils/date_formats.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/utils/patterns.dart';

class CovidSituationInfo {

  // notificados - TOTAL DE CASOS DESDE O DIA  01/03/2020 COM SUSPEITA DE COVID-19 TESTADOS E NÃO TESTADOS
  int allNotifiedCases;
  DateTime allNotifiedCasesDate;

  // Pacientes internados residentes SJDR
  int inpatientResidents;

  // Pacientes que testaram positivo para covid
  int positivePatients;

  int recoveredPositivePatients;

  int quarantinePositivePatients;

  int discardedCases;

  // Óbitos em investigação
  int researchDeaths;

  // Óbitos com exame positivo para covid
  int positiveDeaths;

  CovidSituationInfo.fromElement(Element el) {
    final Element situationNumbersRow = el.children[1];
    allNotifiedCases = int.tryParse(situationNumbersRow.children[0].text);
    inpatientResidents = int.tryParse(situationNumbersRow.children[1].text);
    positivePatients = int.tryParse(situationNumbersRow.children[2].text);
    recoveredPositivePatients = int.tryParse(situationNumbersRow.children[3].text);
    quarantinePositivePatients = int.tryParse(situationNumbersRow.children[4].text);
    discardedCases = int.tryParse(situationNumbersRow.children[5].text);
    researchDeaths = int.tryParse(situationNumbersRow.children[6].text);
    positiveDeaths = int.tryParse(situationNumbersRow.children[7].text);

    allNotifiedCasesDate = allNotifiedCasesDateFormat.parse(
      allNotifiedCasesDatePattern.firstMatch(el.children[0].children[0].children[3].text)[0]
    );
  }

  String toCSVString() {
    return '$allNotifiedCases,$allNotifiedCasesDate,$inpatientResidents,$positivePatients,$recoveredPositivePatients,$quarantinePositivePatients,$discardedCases,$researchDeaths,$positiveDeaths';
  }
  
}
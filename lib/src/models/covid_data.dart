import 'package:html/dom.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_hospital_info.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_neighborhood_info.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_tests.dart';

class CovidData {

  String title;
  DateTime publishedDate;
  int number;

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

  List<CovidTest> tests;

  List<CovidHospitalInfo> hospitalInfos;

  List<CovidNeighborhoodInfo> neighborhoodInfos;

  List<String> dataSources;

  // The div with id "conteudo"
  CovidData.fromElement(Element el) {
    // title = el.quer
  }
  
}
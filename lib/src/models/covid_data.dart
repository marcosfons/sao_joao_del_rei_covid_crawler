import 'package:html/dom.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_hospital_info.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_neighborhood_info.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_situation_info.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_tests.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/utils/date_formats.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/utils/patterns.dart';

class CovidData {

  String newsNumber;
  String title;
  DateTime publishedDate;

  DateTime issuedDate;
  int number;

  CovidSituationInfo situationInfo;

  List<CovidTestInfo> testsInfos;

  List<CovidHospitalInfo> hospitalInfos;

  List<CovidNeighborhoodInfo> neighborhoodInfos;

  CovidData.fromDocument(this.newsNumber, Document dom) {
    title = dom.getElementById('titulo_pagina').innerHtml;
    final List<Element> tables = dom.getElementsByTagName('table');

    issuedDate = issuedDateFormat.parse(
      issuedDatePattern.firstMatch(tables[0].children[0].children[0].children[2].text)[0] + ' ' +
      issuedTimePattern.firstMatch(tables[0].children[0].children[0].children[2].text)[0]  
    );
    publishedDate = publishedDateFormat.parse(
      publishedDatePattern.firstMatch(dom.getElementById('data_fonte_pagina').text)[0].replaceAll(' �s ', ' ')
    );

    number = int.tryParse(numberOnlyPattern.firstMatch(tables[0].children[0].children[0].children[1].text)[0]);

    situationInfo = CovidSituationInfo.fromElement(tables[1].children[0]);

    testsInfos = tables[3].children[0].children[0].children.asMap().entries
      .map<CovidTestInfo>((entry) {
        int idx = entry.key;
        return CovidTestInfo.fromElement(
          entry.value, // name
          tables[3].children[0].children[2].children.sublist(idx * 3, idx * 3 + 3), // data
        );
      }).toList();

    hospitalInfos = tables[2].children[0].children.sublist(3)
      .map<CovidHospitalInfo>((hospitalInfo) => CovidHospitalInfo.fromElement(hospitalInfo))
      .toList();

    neighborhoodInfos = tables[4].children[0].children.sublist(1)
      .map<CovidNeighborhoodInfo>((neighborhoodinfo) => CovidNeighborhoodInfo.fromElement(neighborhoodinfo))
      .toList();
  }

  String toCSVString() {
    return '$newsNumber$title,$publishedDate,$issuedDate,$number';
  }

}
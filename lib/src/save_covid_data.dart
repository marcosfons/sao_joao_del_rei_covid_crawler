import 'dart:io';

import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_data.dart';

Future<void> saveCovidData(CovidData data) async {

  final Directory directory = Directory('data/${extractDirectoryName(data)}');
  if (!directory.existsSync()) {
    directory.createSync();
  } else throw 'Diretório já existe';

  final File mainFile = File('${directory.path}/main.csv');
  if (!mainFile.existsSync()) mainFile.createSync();
  await mainFile.writeAsString(data.toCSVString());

  final File situationFile = File('${directory.path}/situation.csv');
  if (!situationFile.existsSync()) situationFile.createSync();
  await situationFile.writeAsString(data.situationInfo.toCSVString());

  final File testsFile = File('${directory.path}/tests.csv');
  if (!testsFile.existsSync()) testsFile.createSync();
  await testsFile.writeAsString(
    data.testsInfos
      .map<String>((testsInfo) => testsInfo.toCSVString())
      .join('\n')
  );

  final File hospitalFile = File('${directory.path}/hospital.csv');
  if (!hospitalFile.existsSync()) hospitalFile.createSync();
  await hospitalFile.writeAsString(
    data.hospitalInfos
      .map<String>((hospitalInfo) => hospitalInfo.toCSVString())
      .join('\n')
  );

  final File neighborhoodFile = File('${directory.path}/neighborhood.csv');
  if (!neighborhoodFile.existsSync()) neighborhoodFile.createSync();
  await neighborhoodFile.writeAsString(
    data.neighborhoodInfos
      .map<String>((neighborhoodInfo) => neighborhoodInfo.toCSVString())
      .join('\n')
  );
}

String extractDirectoryName(CovidData data) {
  return '${data.newsNumber} ${data.publishedDate.day}.${data.publishedDate.month}.${data.publishedDate.year}';
}
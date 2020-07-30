import 'dart:io';

import 'package:sao_joao_del_rei_covid_crawler/src/get_covid_news_data.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_data.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/save_covid_data.dart';

import 'src/get_all_covid_news_links.dart';

// [24204, 24195, 24193, 24188, 24161, 24125, 24083, 24000, 23978, 23977, 23974, 23947, 23930, 23903, 23887, 23870, 23867, 23860, 23831, 23806, 23783, 23765, 23752, 23747, 23741, 23717, 23701, 23686, 23656, 23650, 23645, 23626, 23616, 23595, 23582, 23564, 23542, 23537, 23534, 23523, 23520, 23499, 23482, 23459, 23450, 23445, 23438, 23430, 23417, 23405, 23389, 23374, 23369, 23364, 23351, 23338, 23317, 23304, 23288, 23282, 23276, 23251, 23235]

void main() async {

  const String allNewsUrl = 'http://covid.saojoaodelrei.mg.gov.br/ws_consulta/Buscar_Noticias_Relacionadas_Por_Categoria.php?INT_CATG=226';
  const String newsBaseUrl = 'http://covid.saojoaodelrei.mg.gov.br/ws_consulta/Noticia.php?INT_NOT=';

  // final List<String> allCovidNewsNumbers = await getAllCovidNewsLinks(allNewsUrl)
  //   .catchError((e) => print('Error while getting the news\n${e.toString()}'));
  // print(allCovidNewsNumbers);

  final Directory dataDirectory = Directory('data');
  if (!dataDirectory.existsSync()) dataDirectory.createSync();

  // try {
    final CovidData covidData = await getCovidNewsData(newsBaseUrl, '23235');
    await saveCovidData(covidData);
    print('Saved');
  // } catch(e) {
  //   print(e.toString());
  // }

  // await Future.forEach(
  //   allCovidNewsNumbers,
  //   (newsNumber) async {
  //     try {
  //       final CovidData covidData = await getCovidNewsData(newsBaseUrl, newsNumber);
  //       await saveCovidData(covidData);
  //     } catch(e) {
  //       print(e.toString());
  //     }
  //   }
  // );

}
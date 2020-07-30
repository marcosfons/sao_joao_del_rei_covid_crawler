import 'package:sao_joao_del_rei_covid_crawler/src/get_covid_news_data.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/models/covid_data.dart';
import 'package:test/test.dart';

void main() {
  test('Get Covid News data', () async {
    
    const String newsLink = 'http://covid.saojoaodelrei.mg.gov.br/noticia/24204';

    final CovidData covidData = await getCovidNewsData(newsLink);

    print(covidData);

  });
}
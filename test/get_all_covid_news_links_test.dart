

import 'package:sao_joao_del_rei_covid_crawler/src/get_all_covid_news_links.dart';
import 'package:test/test.dart';

void main() {
  test('Test the all news crawler', () async {
    const String startLink = 'http://covid.saojoaodelrei.mg.gov.br/ws_consulta/Buscar_Noticias_Relacionadas_Por_Categoria.php?INT_CATG=226';
    const String baseUrl = 'http://covid.saojoaodelrei.mg.gov.br';

    final List<String> allCovidNewsLinks = await getAllCovidNewsLinks(startLink, baseUrl)
      .then((value) => value..removeAt(0))
      .catchError((e) => []);

    expect(allCovidNewsLinks != null && allCovidNewsLinks.isNotEmpty, true);
    expect(
      allCovidNewsLinks
        .map<bool>((e) => e.startsWith('http://covid.saojoaodelrei.mg.gov.br/noticia/'))
        .reduce((value, element) => value && element),
      true
    );
  });
}
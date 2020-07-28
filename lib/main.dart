

void main() async {

  const String startLink = 'http://covid.saojoaodelrei.mg.gov.br/ws_consulta/Buscar_Noticias_Relacionadas_Por_Categoria.php?INT_CATG=226';

  final List<String> allCovidNewsLinks = await getAllNews(startLink)
    .catchError((e) => print('Error while getting the news\n${e.toString()}'));

  if (allCovidNewsLinks != null && allCovidNewsLinks.isNotEmpty) {
    await Future.forEach(
      allCovidNewsLinks, 
      (String covidNewsLink) {
        final CovidData covidData = await getNewsCovidData(covidNewsLink);
        await publishCovidData(covidData);
      }
    );
  }
}
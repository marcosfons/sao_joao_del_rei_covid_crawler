import 'package:html/dom.dart';
import 'package:sao_joao_del_rei_covid_crawler/src/utils/patterns.dart';

class CovidHospitalInfo {

  String hospitalName;

  /// Pacientes internados
  int inpatients;

  /// Pacientes internados na UTI com ventilação mecânica
  int inpatientsUTIVM;

  /// Pacientes internados na UTI sem ventilação mecânica
  int inaptientsUTI;

  /// Pacientes internados em leitos clínicos
  int inpatientsClinicalBeds;

  int transfers;

  /// Alta Clínica
  int hospitalDischarge;

  int deaths;

  /// Pacientes internados testado positivo
  int positiveInpatients;

  CovidHospitalInfo.fromElement(Element el) {
    hospitalName = el.children[0].text.trim().replaceAll(spacesPattern, ' ');
    inpatientsUTIVM = int.tryParse(el.children[1].text.trim());
    inaptientsUTI = int.tryParse(el.children[2].text.trim());
    inpatientsClinicalBeds = int.tryParse(el.children[3].text.trim());
    transfers = int.tryParse(el.children[4].text.trim());
    hospitalDischarge = int.tryParse(el.children[5].text.trim());
    deaths = int.tryParse(el.children[6].text.trim());
    positiveInpatients = int.tryParse(el.children[7].text.trim());

    inpatients = inpatientsClinicalBeds + inpatientsUTIVM + inaptientsUTI;
  }

  String toString() {
    return '$hospitalName $inpatients $inpatientsUTIVM $inaptientsUTI $inpatientsClinicalBeds $transfers $hospitalDischarge $deaths $positiveInpatients';
  }

  String toCSVString() {
    return '$hospitalName,$inpatients,$inpatientsUTIVM,$inaptientsUTI,$inpatientsClinicalBeds,$transfers,$hospitalDischarge,$deaths,$positiveInpatients';
  }

}
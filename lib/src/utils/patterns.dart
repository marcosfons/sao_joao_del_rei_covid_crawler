final RegExp spacesPattern = RegExp(r'[ ]{2,}');
final RegExp numberOnlyPattern = RegExp(r'[0-9]+');
// final RegExp issuedDatePattern = RegExp(r'[0-9]{2}\/[0-9]{2}\/[0-9]{4}.{0,1}.{0,1}[0-9]{2}:[0-9]{2}');
final RegExp issuedDatePattern = RegExp(r'[0-9]{2}\/[0-9]{2}\/[0-9]{4}');
final RegExp issuedTimePattern = RegExp(r'[0-9]{2}:[0-9]{2}');
final RegExp publishedDatePattern = RegExp(r'[0-9]{2}\/[0-9]{2}\/[0-9]{4}....[0-9]{2}:[0-9]{2}:[0-9]{2}');
final RegExp allNotifiedCasesDatePattern = RegExp(r'[0-9]{2}\/[0-9]{2}\/[0-9]{4}');
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

Future<List<List<dynamic>>> readCSV(String path) async {
  final String csvData = await rootBundle.loadString(path);
  final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);
  return csvTable;
}

import 'package:flutter/material.dart';
import 'csv_reader.dart'; // Importa el archivo csv_reader.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CsvScreen(), // Cambiamos MyHomePage por CsvScreen
    );
  }
}

class CsvScreen extends StatefulWidget {
  const CsvScreen({super.key});

  @override
  _CsvScreenState createState() => _CsvScreenState();
}

class _CsvScreenState extends State<CsvScreen> {
  List<List<dynamic>> _data = []; // Aquí se almacenarán los datos del CSV

  @override
  void initState() {
    super.initState();
    loadCSV(); // Llama a la función para cargar los datos cuando el widget se inicialice
  }

  void loadCSV() async {
    final data = await readCSV('assets/sample.csv'); // Lee los datos del archivo CSV
    setState(() {
      _data = data; // Actualiza el estado con los datos leídos
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leer CSV en Flutter'), // Título de la aplicación
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _data.isNotEmpty
          ? ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_data[index].join(", ")), // Muestra los datos en una lista
                );
              },
            )
          : const Center(child: CircularProgressIndicator()), // Muestra un indicador de carga mientras se cargan los datos
    );
  }
}

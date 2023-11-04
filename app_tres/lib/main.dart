import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pago Grupal',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        hintColor: Colors.lightBlue,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pago Grupal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _totalCuenta = 0;
  int _numeroPersonas = 1;
  int _propina = 0;

  final _totalCuentaController = TextEditingController();
  final _numeroPersonasController = TextEditingController();
  final _propinaController = TextEditingController();

  void _calcularPago() {
    setState(() {
      _totalCuenta = int.tryParse(_totalCuentaController.text) ?? 0;
      _numeroPersonas = int.tryParse(_numeroPersonasController.text) ?? 1;
      _propina = int.tryParse(_propinaController.text) ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '!Pagan todos¡',
              style: TextStyle(
                fontSize: 24,
                color: Colors.lightGreen,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _totalCuentaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Total de la Cuenta',
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _numeroPersonasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número de Personas',
                prefixIcon: Icon(Icons.people),
              ),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _propinaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Propina',
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _calcularPago,
              child: const Text("Calcular"),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Total a Pagar: \$${_totalCuenta + _propina}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.lightBlue,
              ),
            ),
            Text(
              'Cada Persona Paga: \$${(_totalCuenta + _propina) / _numeroPersonas}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

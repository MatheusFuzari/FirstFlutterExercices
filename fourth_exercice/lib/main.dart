import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _studentController = TextEditingController();
  final _firstGrade = TextEditingController();
  final _secoundGrade = TextEditingController();
  final _thirdGrade = TextEditingController();
  final _fourthGrade = TextEditingController();
  String _mean = "";
  Padding typer(String hint, TextEditingController controller, bool numeric) {
    if (numeric) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hint,
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(), hintText: hint),
        ),
      );
    }
  }
  void _calcAvg() {
    setState(() {
      double calc = (double.parse(_firstGrade.text)+double.parse(_secoundGrade.text)+double.parse(_thirdGrade.text)+double.parse(_fourthGrade.text))/4;
      _mean = calc.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            typer("Digite o nome do aluno", _studentController, false),
            typer("Digite a primeira nota", _firstGrade, true),
            typer("Digite a segunda nota", _secoundGrade, true),
            typer("Digite a terceira nota", _thirdGrade, true),
            typer("Digite a quarta nota", _fourthGrade, true),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("A média é: "+_mean),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calcAvg,
        tooltip: 'Calculate average',
        child: const Icon(Icons.wifi_tethering_error_sharp),
      ),
    );
  }
}

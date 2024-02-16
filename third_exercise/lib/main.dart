import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _drivers = ["Lewis Hamilton", "Sebastian Vettel", "Max Verstappen", "Charles Leclerc"];
  final List<String> _driversAge = ["39", "36", "26", "26"];
  final List<String> _driversChampionship = ["7", "4", "3", "0"];
  final List<String> _driversImage = ["assets/lewis","assets/vettel","assets/max","assets/leclerc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Drivers"),
      ),
      body: Center(
        child: ListView.separated(
          padding: EdgeInsets.all(8.0),
          itemCount: _drivers.length,
          itemBuilder: (BuildContext context, index){
            return Container();
          },
          separatorBuilder: (BuildContext context, index) => const Divider(),
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final List<String> _drivers = [
    "Lewis Hamilton",
    "Sebastian Vettel",
    "Max Verstappen",
    "Charles Leclerc"
  ];
  final List<String> _driversAge = ["39", "36", "26", "26"];
  final List<String> _driversChampionship = ["7", "4", "3", "0"];
  final List<String> _driversImage = [
    "assets/lewis",
    "assets/vettel",
    "assets/max",
    "assets/leclerc"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Drivers?"),
        ),
        body: Center(
          child: ListView.separated(
            padding: const EdgeInsets.all(8.0),
            itemCount: _drivers.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 160,
                        width: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('${_driversImage[index]}.png'),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            _drivers[index],
                            style: TextStyle(
                                color: Colors.red.shade800,
                                fontSize: 15,
                                fontFamily: "Persona",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  FontAwesomeIcons.crown,
                                  size: 12,
                                  color: Colors.red.shade800,
                                ),
                              ),
                              Text(
                                "   =  ${_driversChampionship[index]}x",
                                style: TextStyle(
                                    color: Colors.red.shade800,
                                    fontSize: 15,
                                    fontFamily: "Persona",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, index) => const Divider(),
          ),
        ));
  }
}

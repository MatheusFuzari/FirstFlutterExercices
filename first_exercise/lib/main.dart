import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  final myNameController = TextEditingController();
  final myAgeController = TextEditingController();
  final myEmailController = TextEditingController();
  final myPhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("SM Mobile"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: const Text(
                "Self data request",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                    fontStyle: FontStyle.normal),
              ),
            ),
            typer("Type your name",myNameController ,false),
            typer("How old are you? ",myAgeController, true),
            typer("Type your e-mail ",myEmailController, false),
            typer("Type your phone number",myPhoneController, true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Name: ${myNameController.text}\nAge: ${myAgeController.text}"
          "\nE-mail: ${myEmailController.text}\nPhone: ${myPhoneController.text}");
        },
        child: Icon(
          IconData(0xe571,
              fontFamily: 'MaterialIcons', matchTextDirection: true),
        ),
      ),
    );
  }
}

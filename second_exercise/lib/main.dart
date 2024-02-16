import 'package:flutter/material.dart';

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
  final List<String> names = [
    "Coca-cola lata",
    "Doritos pequeno",
    "Amaciante Pinheiro",
    "Macarrão Penne"
  ];
  final List<double> prices = [5.50, 7.99, 23.60, 12.20];
  final List<int> quantity = [0, 0, 0, 0];
  bool _clicked = false;

  Widget _getValue(){
    double value = 0.0;
    for (var i=0; i <= (prices.length-1); i++){
      value += (prices[i]*quantity[i]);
    }
    _clicked = false;
    return Text("Balance: ${(value).toStringAsFixed(2)}");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Grocery Shop"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.blueGrey,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  names[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                "R\$: ${prices[index]}",
                                style: const TextStyle(color: Colors.white, fontSize: 15),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity[index] >= 1) {
                                      quantity[index] = quantity[index] - 1;
                                    }
                                  });
                                },
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${quantity[index]}",
                                style: const TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity[index] = quantity[index] + 1;
                                    });
                                  },
                                  backgroundColor: Colors.grey,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
            ),
            Container(
              child: Builder(
                builder: (context) {
                  if(_clicked){
                    return _getValue();
                  }else{
                    return Text("");
                  }
                },
              ),
            ),
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _clicked = true;
          });
        },
        tooltip: 'Finish shopping',
        child: const Icon(Icons.account_balance_wallet),
      ),
    );
  }
}

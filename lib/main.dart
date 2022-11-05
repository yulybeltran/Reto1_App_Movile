import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MINTIC-Reto1',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Conversor de Monedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textorigen = TextEditingController();
final textdestino = TextEditingController();

class calculadora {
  final titulo;
  final icono1;
  final color;

  calculadora(this.titulo, this.icono1, this.color);
}

//var item = ["USD", "COP", "EUR"];
//List<String> item2 = <String>["USD", "COP", "EUR"];
String op1 = "USD";
String op2 = "COP";

List<DropdownMenuItem<String>> item3 = <DropdownMenuItem<String>>[
  DropdownMenuItem(
    child: Text("USD"),
    value: "USD",
  ),
  DropdownMenuItem(
    child: Text("EUR"),
    value: "EUR",
  ),
  DropdownMenuItem(
    child: Text("COP"),
    value: "COP",
  ),
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Icon(Icons.abc), Colors.purple[100]),
  calculadora("8", Icon(Icons.abc), Colors.purple[100]),
  calculadora("7", Icon(Icons.abc), Colors.purple[100]),
  calculadora("6", Icon(Icons.abc), Colors.purple[100]),
  calculadora("5", Icon(Icons.abc), Colors.purple[100]),
  calculadora("4", Icon(Icons.abc), Colors.purple[100]),
  calculadora("3", Icon(Icons.abc), Colors.purple[100]),
  calculadora("2", Icon(Icons.abc), Colors.purple[100]),
  calculadora("1", Icon(Icons.abc), Colors.purple[100]),
  calculadora("0", Icon(Icons.abc), Colors.purple[100]),
  calculadora(
      "Limpiar",
      Icon(Icons.delete_outline_outlined, size: 28, color: Colors.black87),
      Colors.cyan),
  calculadora("calcular",
      Icon(Icons.attach_money, size: 28, color: Colors.black87), Colors.cyan),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(children: [
                Text(
                  "De : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
                DropdownButton(
                    value: op1,
                    items: item3,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.cyan,
                        fontStyle: FontStyle.italic),
                    onChanged: (String? x) {
                      setState(() {
                        op1 = x.toString();
                      });
                    }),
                VerticalDivider(),
                VerticalDivider(),
                VerticalDivider(),
                VerticalDivider(),
                VerticalDivider(),
                Text(
                  "A : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic),
                ),
                DropdownButton(
                    value: op2,
                    items: item3,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.cyan,
                        fontStyle: FontStyle.italic),
                    onChanged: (String? x) {
                      setState(() {
                        op2 = x.toString();
                      });
                    }),
              ]),
              TextField(
                controller: textorigen,
                decoration: InputDecoration(
                  labelText: "Valor a Convertir",
                  hintText: "0",
                ),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
              TextField(
                controller: textdestino,
                decoration: InputDecoration(
                    labelText: "Valor de Cambio", hintText: "0"),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
              Divider(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: cal.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return Card(
                        color: cal[index].color,
                        child: ListTile(
                          title: Center(
                            child: index > 9
                                ? cal[index].icono1
                                : Text(
                                    cal[index].titulo,
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                          ),
                          onTap: () {
                            print(cal[index].titulo);

                            if (index < 10) {
                              textorigen.text =
                                  textorigen.text + cal[index].titulo;
                            } else if (index == 10) {
                              textorigen.text = "";
                              textdestino.text = "";
                            } else {
                              if (op1 == "USD" && op2 == "COP") {
                                textdestino.text =
                                    (double.parse(textorigen.text) * 5000)
                                        .toString();
                              } else if (op1 == "COP" && op2 == "USD") {
                                textdestino.text =
                                    (double.parse(textorigen.text) / 5000)
                                        .toString();
                              } else if (op1 == "EUR" && op2 == "COP") {
                                textdestino.text =
                                    (double.parse(textorigen.text) * 5050)
                                        .toString();
                              } else if (op1 == "COP" && op2 == "EUR") {
                                textdestino.text =
                                    (double.parse(textorigen.text) / 5050)
                                        .toString();
                              } else if (op1 == "EUR" && op2 == "USD") {
                                textdestino.text =
                                    (double.parse(textorigen.text) * 0.99)
                                        .toString();
                              } else if (op1 == "USD" && op2 == "EUR") {
                                textdestino.text =
                                    (double.parse(textorigen.text) / 5050)
                                        .toString();
                              } else {
                                textdestino.text = textorigen.text;
                              }
                            }
                          },
                        ));
                  },
                ),
              )
            ],
          )),
    );
  }
}

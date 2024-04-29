import 'dart:math';

import 'package:flutter/material.dart';
import 'findFpb.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _bilangan1Controller = TextEditingController();
  final TextEditingController _bilangan2Controller = TextEditingController();
  String _resultText = "";

  @override
  Widget build(BuildContext context) {
    List<List<int>> array2D = generateArrayData();

    return MaterialApp(
      title: 'Array & FPB Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Array & FPB Demo'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Isi List:",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: array2D
                    .map(
                      (row) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: row
                              .map(
                                (value) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    '$value',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Divider(thickness: 2),
              Text(
                "FPB Calculator",
                style: TextStyle(fontSize: 18),
              ),
              Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _bilangan1Controller,
                        decoration: InputDecoration(
                          labelText: "Bilangan 1",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a number";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _bilangan2Controller,
                        decoration: InputDecoration(
                          labelText: "Bilangan 2",
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a number";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final bilangan1 = int.tryParse(_bilangan1Controller.text);
                  final bilangan2 = int.tryParse(_bilangan2Controller.text);

                  if (bilangan1 != null && bilangan2 != null) {
                    int fpb = findFpb(bilangan1, bilangan2);
                    setState(() {
                      _resultText = "FPB dari $bilangan1 dan $bilangan2 = $fpb";
                    });
                  } else {
                    setState(() {
                      _resultText = "Please enter valid numbers.";
                    });
                  }
                },
                child: Text("Hitung FPB"),
              ),
              Text(
                _resultText,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<List<int>> generateArrayData() {
  List<List<int>> array2D = List.generate(4, (index) => []);

  // Baris 1: 4 bilangan kelipatan 6 berurutan mulai dari 6
  array2D[0] = List.generate(4, (index) => 6 * (index + 1));

  // Baris 2: 5 bilangan ganjil berurutan mulai dari 3
  array2D[1] = List.generate(5, (index) => 2 * index + 3);

  // Baris 3: 6 bilangan pangkat tiga dari bilangan asli mulai dari 4
  array2D[2] = List.generate(6, (index) => pow(index + 4, 3) as int);

  // Baris 4: 7 bilangan asli berurutan beda 7 mulai dari 3
  array2D[3] = List.generate(7, (index) => 3 + 7 * index);

  return array2D;
}

List<Widget> getArrayWidgets(List<List<int>> array2D) {
  List<Widget> widgets = [];
  for (List<int> row in array2D) {
    for (int value in row) {
      widgets.add(Chip(label: Text("$value")));
    }
  }
  return widgets;
}

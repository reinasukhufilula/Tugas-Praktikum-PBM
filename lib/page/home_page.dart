import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.pink[200];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HITUNG BMI'),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      body: Center(
          child: Center(
              child: Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Yuks Hitung BMI :)',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w500),
                      ),
                      Image(
                        image: AssetImage("assets/home.jpg"),
                        width: 200.0,
                        height: 200.0,
                        // fit: BoxFit.cover,
                      ),
                      TextField(
                        controller: wtController,
                        decoration: InputDecoration(
                            label: Text('Masukkan berat badan (Kg)'),
                            prefixIcon: Icon(Icons.line_weight)),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: inController,
                        decoration: InputDecoration(
                            label: Text('Masukkan tinggi badan (Cm)'),
                            prefixIcon: Icon(Icons.height)),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            var wt = wtController.text.toString();
                            var ft = ftController.text.toString();
                            var inch = inController.text.toString();
                            if (wt != "" && ft != "" && inch != "") {
                              var iWt = int.parse(wt);
                              var iFt = int.parse(ft);
                              var iInch = int.parse(inch);
                              var tInch = iInch;
                              var tCm = tInch;
                              var tM = tCm / 100;
                              var bmi = iWt / (tM * tM);
                              var msg = "";

                              if (bmi > 25) {
                                msg = "OVERWEIGHT";
                              } else if (bmi < 18) {
                                msg = "UNDERWEIGHT";
                              } else {
                                msg = "NORMAL";
                              }
                              setState(() {
                                result =
                                    "$msg\n BMI is: ${bmi.toStringAsExponential(4)}";
                              });
                            } else {
                              setState(() {
                                result = "Silahkan Isi Kolom diatas!!";
                              });
                            }
                          },
                          child: Text('HITUNG')),
                      SizedBox(
                        height: 12,
                      ),
                      Text(result, style: TextStyle(fontSize: 20))
                    ],
                  )))),
    );
  }
}

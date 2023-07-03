import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/elevetedbutton.dart';
import 'package:flutter_application_1/widgets/textformfield.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  String result = "";
  double h = 0;
  double w = 0;
  void bmicalculate(double hieght, double waight) {
    double finalresult = waight / (hieght * hieght / 1000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  final TextEditingController hieght = TextEditingController();
  final TextEditingController waight = TextEditingController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Man", Colors.black, 0),
                  radioButton('Women', Colors.pink, 1)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Height is cm's",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  hintText: 'Enter your height', controller: hieght),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Your wieght is kg's",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                  hintText: 'Enter your wieght', controller: waight),
              const SizedBox(
                height: 8,
              ),
              ElevatedButtonContainer(
                  buttonText: "Calculate",
                  onPressed: () {
                    setState(() {
                      h = double.parse(hieght.value.text);
                      w = double.parse(waight.value.text);
                    });
                    bmicalculate(h, w);
                  }),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Your BMI is: ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  " $result",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeindex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        height: 80.0,
        margin: const EdgeInsets.symmetric(horizontal: 14.0),
        color: currentindex == index ? Colors.red : Colors.green,
        child: ElevatedButton(
          onPressed: () {
            changeindex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
            ),
          ),
        ),
      ),
    );
  }
}

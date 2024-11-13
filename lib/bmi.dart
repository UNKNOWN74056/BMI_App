import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Provider_Service.dart';
import 'package:flutter_application_1/provider/Validation_provider.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/widgets/Radio_Button.dart';
import 'package:flutter_application_1/widgets/elevetedbutton.dart';
import 'package:flutter_application_1/widgets/textformfield.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bmi extends StatefulWidget {
  const bmi({super.key});

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  String result = "";
  double h = 0;
  double w = 0;
  void bmicalculate(double height, double weight) {
    Provider.of<BmiProvider>(context, listen: false).setHeight(height);
    Provider.of<BmiProvider>(context, listen: false).setWeight(weight);
    Provider.of<BmiProvider>(context, listen: false).calculateBMI();
  }

  @override
  Widget build(BuildContext context) {
    final validationcontroller =
        Provider.of<validaiton>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  RadioButton(
                    iconData: FontAwesomeIcons.mars, // Use the desired icon
                    index: 0,
                  ),
                  RadioButton(
                    iconData: FontAwesomeIcons.venus, // Use the desired icon
                    index: 1,
                  ),
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
              Consumer<validaiton>(builder: (context, value, child) {
                return CustomTextField(
                    onchange: (String value) {
                      validationcontroller.validatehight(value);
                    },
                    errormessage: value.height.error,
                    hintText: 'Enter your height',
                    controller: validationcontroller.heightController);
              }),
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
              Consumer<validaiton>(builder: (context, value, child) {
                return CustomTextField(
                    onchange: (String value) {
                      validationcontroller.validateweight(value);
                    },
                    errormessage: value.weight.error,
                    hintText: 'Enter your wieght',
                    controller: validationcontroller.waightController);
              }),
              const SizedBox(
                height: 8,
              ),
              ElevatedButtonContainer(
                buttonText: "Calculate",
                onPressed: () {
                  if (!validationcontroller.isvalid) {
                    utils.Show_Flushbar_Error_Message(
                        "Please enter your field", context);
                  } else {
                    try {
                      double heightValue = double.parse(
                          validationcontroller.heightController.text);
                      double weightValue = double.parse(
                          validationcontroller.waightController.text);

                      Provider.of<BmiProvider>(context, listen: false)
                          .setHeight(heightValue);
                      Provider.of<BmiProvider>(context, listen: false)
                          .setWeight(weightValue);

                      bmicalculate(
                        Provider.of<BmiProvider>(context, listen: false).h,
                        Provider.of<BmiProvider>(context, listen: false).w,
                      );
                    } catch (e) {
                      utils.Show_Flushbar_Error_Message(
                          "Invalid numeric values", context);
                    }
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.teal),
                margin: const EdgeInsets.only(left: 40, right: 40),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " Result: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Consumer<BmiProvider>(
                      builder: (context, bmiProvider, child) => Text(
                        bmiProvider.result,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeindex(int index) {
    Provider.of<BmiProvider>(context, listen: false).changeIndex(index);
  }
}

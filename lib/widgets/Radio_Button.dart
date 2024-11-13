import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/Provider_Service.dart';
import 'package:provider/provider.dart';

class RadioButton extends StatelessWidget {
  final IconData iconData;
  final int index;

  const RadioButton({Key? key, required this.iconData, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<BmiProvider>(context).currentIndex;

    return Expanded(
      child: Container(
        height: 90.0,
        margin: const EdgeInsets.symmetric(horizontal: 14.0),
        child: ElevatedButton(
          onPressed: () {
            Provider.of<BmiProvider>(context, listen: false).changeIndex(index);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                currentIndex == index ? Colors.green : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Icon(
            iconData,
            size: 40,
            color: currentIndex == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

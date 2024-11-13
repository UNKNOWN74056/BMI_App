import 'package:flutter/material.dart';
import 'package:flutter_application_1/bmi.dart';
import 'package:flutter_application_1/provider/Provider_Service.dart';
import 'package:flutter_application_1/provider/Validation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BmiProvider()
        ),
        ChangeNotifierProvider(create: (context) => validaiton()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const bmi(),
    );
  }
}

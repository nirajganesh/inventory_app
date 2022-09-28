import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inventory_app/provider/expances_provider.dart';
import 'package:inventory_app/provider/sales_provider.dart';
import 'package:inventory_app/screens/dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => expances_provider()),
      ChangeNotifierProvider(create: (_) => sales_provider()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffB001FD),
        fontFamily: 'Montserrat',
      ),
      home: dashboard(),
    );
  }
}



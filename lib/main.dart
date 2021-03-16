import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/deshboard.dart';
import 'provider/date_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DateProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.green, brightness: Brightness.dark),
      home: DashboardDemo(),
    );
  }
}

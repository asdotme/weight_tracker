import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/repository/data_provider.dart';
import 'package:weight_tracker/routes.dart';
import 'package:weight_tracker/view/screen/weight_register.screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider.init(),
      child: const MyApp(),
    ),
  );}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'WeightTracker App',
      theme: ThemeData(),
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}

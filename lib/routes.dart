import 'package:flutter/material.dart';

import './view/screen/home.screen.dart';
import './view/screen/weight_register.screen.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomeScreen()
        );
      case '/weight_register' :
        return MaterialPageRoute(
            builder: (_)=> WeightRegister()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
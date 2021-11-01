import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/repository/data_provider.dart';
import 'package:weight_tracker/constants.dart';

class AverageWeightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, p, c) {
      return Center(
        child: Text(
          p.averageWeight + Constant.measureUnit,
          style: const TextStyle(fontSize: 30,color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      );
    });
  }
}

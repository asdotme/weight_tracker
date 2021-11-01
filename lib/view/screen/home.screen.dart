import 'package:flutter/material.dart';
import 'package:weight_tracker/view/widget/average_weight.widget.dart';
import 'package:weight_tracker/view/widget/weight_list.widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight Tracker'),
      ),
      body: Container(
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: AverageWeightWidget(),
              ),
            ),
            Divider(
              thickness: 6,
              color: Color.fromRGBO(173, 216, 230, 0.4),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: WeightListWidget(),
              ),
            ),
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          Navigator.pushNamed(context, "/weight_register");
        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }
}

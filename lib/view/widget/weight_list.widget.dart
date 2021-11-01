import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/repository/data_provider.dart';
import 'package:weight_tracker/view/util.view.dart';
import 'package:weight_tracker/constants.dart';

class WeightListWidget extends StatelessWidget {
  static const routeName = "weight_list";

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, dataProvider, c) {

      if(dataProvider.items.isEmpty){
        return Text("No record yet.");
      }
      return ListView.builder(
        itemCount: dataProvider.items.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            elevation: 0,
            child: ListTile(
              leading: Text(
                dataProvider.items[position].weight.toString()+Constant.measureUnit,
                style: const TextStyle(fontSize: 25),
              ),
              title: Text(
                  UtilView.getFormattedDate(dataProvider.items[position].date)),
            ),
          );
        },
      );
    });
  }
}

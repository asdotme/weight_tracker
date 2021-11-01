import 'package:flutter/foundation.dart';
import 'package:weight_tracker/model/Weight.model.dart';
import 'package:weight_tracker/repository/database_helper.dart';

class DataProvider with ChangeNotifier {

  List<WeightModel> _items = [];
  final tableName = 'my_table';
  String _averageWeight = "0.0";
  DataProvider.init() {
    fetchAndSetData();
  }

  List<WeightModel> get items => [..._items];
  String get averageWeight => _averageWeight;

  Future<dynamic> fetchAndSetData() async {
    List<Map<String, dynamic>>? dataList =
        await DatabaseHelper.instance.queryAllRows();
    if (dataList != null) {
      _items = dataList
          .map((item) => WeightModel(
              weight: double.parse(item['weight']), date: item['date']))
          .toList();
      _items.sort((a,b) =>  DateTime.parse(b.date).compareTo(DateTime.parse(a.date)) );
      calculateAverage();
      notifyListeners();
    }
  }

  calculateAverage() {
    double total = 0;
    for (int i = 0; i < items.length; i++) {
      total = total + items[i].weight;
    }

    if(items.length == 0){
      _averageWeight  = "0.0";
    } else {
      _averageWeight = (total / items.length).toStringAsFixed(1);
    }
  }
}

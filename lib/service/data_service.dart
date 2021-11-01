import 'package:weight_tracker/repository/database_helper.dart';

class DataService {

  DataService._privateConstructor();
  static final DataService instance = DataService._privateConstructor();

  insertWeight(double weight){
    String date = DateTime.now().toString();

    Map<String, dynamic> map = {
      'weight': weight,
      'date': date,
    };
    DatabaseHelper.instance.insert(map);
  }

}
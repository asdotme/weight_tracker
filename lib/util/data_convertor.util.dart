import 'package:weight_tracker/model/weight.model.dart';

class DataConvertorUtil {
  static List<WeightModel> getWeightList(List<Map<String, dynamic>>? weightMapList) {
    List<WeightModel> weightList = [];
    if(weightMapList!=null) {
      int count = weightMapList.length;

      for (int i = 0; i < count; i++) {
        weightList.add(WeightModel.fromMapObject(weightMapList[i]));
      }
    }

    return weightList;
  }
}

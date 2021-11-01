class WeightModel {
  late double weight;
  late String date;

  WeightModel({
    required this.weight,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'date': date,
    };
  }

  WeightModel.fromMapObject(Map<String, dynamic>? map) {
    if(map!=null) {
      this.weight = double.parse(map['weight']);
      this.date = map['date'];
    }
  }
}
/// TODO: docs
class PairHourTokenModel {
  PairHourTokenModel({this.time, this.price});

  /// TODO: docs
  final DateTime? time;

  /// TODO: docs
  final double? price;

  /// TODO: docs
  factory PairHourTokenModel.fromJson(Map<String, dynamic> json) {
    final time = DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000);
    final price =
        double.parse(json['reserve0']) / double.parse(json['reserve1']);

    return PairHourTokenModel(time: time, price: price);
  }
}

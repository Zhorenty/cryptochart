class PairHourTokenModel {
  final DateTime time;
  final double price;
  PairHourTokenModel({
    required this.time,
    required this.price,
  });

  factory PairHourTokenModel.fromJson(Map<String, dynamic> json) {
    final time = DateTime.fromMillisecondsSinceEpoch(
      json['hourStartUnix'] * 1000,
    );
    final price =
        double.parse(json['reserve0']) / double.parse(json['reserve1']);
    return PairHourTokenModel(
      time: time,
      price: price,
    );
  }
}

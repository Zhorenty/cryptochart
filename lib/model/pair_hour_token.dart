import 'package:json_annotation/json_annotation.dart';

part 'pair_hour_token.g.dart';

@JsonSerializable()
class PairHourTokenModel {
  PairHourTokenModel({
    required this.hourStartUnix,
    required this.firstReserve,
    required this.secondReserve,
  });
  int hourStartUnix;
  double firstReserve;
  double secondReserve;

  factory PairHourTokenModel.fromJson(Map<String, dynamic> json) =>
      _$PairHourTokenModelFromJson(json);
}

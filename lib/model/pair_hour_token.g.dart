// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pair_hour_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PairHourTokenModel _$PairHourTokenModelFromJson(Map<String, dynamic> json) =>
    PairHourTokenModel(
      hourStartUnix: json['hourStartUnix'] as int,
      firstReserve: (json['firstReserve'] as num).toDouble(),
      secondReserve: (json['secondReserve'] as num).toDouble(),
    );

Map<String, dynamic> _$PairHourTokenModelToJson(PairHourTokenModel instance) =>
    <String, dynamic>{
      'hourStartUnix': instance.hourStartUnix,
      'firstReserve': instance.firstReserve,
      'secondReserve': instance.secondReserve,
    };

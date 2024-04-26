import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance_model.g.dart';

@JsonSerializable()
class BalanceModel extends Equatable {
  const BalanceModel({
    required this.totalBalance,
    required this.income,
    required this.expenses,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceModelFromJson(json);

  @JsonKey(fromJson: _fromJson)
  final double? totalBalance;
  @JsonKey(fromJson: _fromJson)
  final double? income;
  @JsonKey(fromJson: _fromJson)
  final double? expenses;

  Map<String, dynamic> toJson() => _$BalanceModelToJson(this);

  static double _fromJson(dynamic value) {
    return double.tryParse(value['aggregate']['sum']['value'].toString()) ??
        0.0;
  }

  @override
  List<Object?> get props => [
        totalBalance,
        income,
        expenses,
      ];
}

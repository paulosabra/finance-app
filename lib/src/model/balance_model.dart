import 'dart:convert';

// TODO: use @JsonSerializable()
class BalanceModel {
  BalanceModel({
    required this.totalBalance,
    required this.income,
    required this.expenses,
  });

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      totalBalance: double.tryParse(
            map['totalBalance']['aggregate']['sum']['value'].toString(),
          ) ??
          0,
      income: double.tryParse(
            map['income']['aggregate']['sum']['value'].toString(),
          ) ??
          0,
      expenses: double.tryParse(
            map['expenses']['aggregate']['sum']['value'].toString(),
          ) ??
          0,
    );
  }

  factory BalanceModel.fromJson(String source) =>
      BalanceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final double totalBalance;
  final double income;
  final double expenses;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalBalance': totalBalance,
      'income': income,
      'totalOutcome': expenses,
    };
  }

  String toJson() => json.encode(toMap());
}

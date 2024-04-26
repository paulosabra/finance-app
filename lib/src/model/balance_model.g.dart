// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) => BalanceModel(
      totalBalance: BalanceModel._fromJson(json['totalBalance']),
      income: BalanceModel._fromJson(json['income']),
      expenses: BalanceModel._fromJson(json['expenses']),
    );

Map<String, dynamic> _$BalanceModelToJson(BalanceModel instance) =>
    <String, dynamic>{
      'totalBalance': instance.totalBalance,
      'income': instance.income,
      'expenses': instance.expenses,
    };

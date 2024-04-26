import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Equatable {
  const TransactionModel({
    this.description,
    this.category,
    this.value,
    this.date,
    this.status,
    this.createdAt,
    this.id,
    this.userId,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  final String? id;
  final String? description;
  final String? category;
  final bool? status;
  final double? value;
  final DateTime? date;
  final DateTime? createdAt;
  final String? userId;

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        description,
        category,
        status,
        value,
        date,
        createdAt,
        userId,
      ];
}

typedef Transactions = List<TransactionModel>;

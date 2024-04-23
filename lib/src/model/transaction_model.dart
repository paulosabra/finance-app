import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends Equatable {
  const TransactionModel({
    this.id,
    this.date,
    this.title,
    this.value,
  });

  final String? id;
  final String? title;
  final double? value;
  final int? date;

  @override
  List<Object?> get props => [
        title,
        value,
        date,
      ];
}

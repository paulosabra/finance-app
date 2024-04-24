import 'package:mono/src/model/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> registerNewTransaction();

  Future<Transactions> getAllTransactions();
}

import 'package:mono/src/model/balance_model.dart';
import 'package:mono/src/model/transaction_model.dart';

abstract class TransactionRepository {
  Future<BalanceModel> getBalance();

  Future<Transactions> getAllTransactions();
}

import 'package:mono/src/model/transaction_model.dart';
import 'package:mono/src/repositories/transaction/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> registerNewTransaction() {
    // TODO: implement registerNewTransaction
    throw UnimplementedError();
  }

  @override
  Future<Transactions> getAllTransactions() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      TransactionModel(
        id: '1',
        title: 'Upwork',
        value: 850.50,
        date: DateTime.now().millisecondsSinceEpoch,
      ),
      TransactionModel(
        id: '2',
        title: 'Transfer',
        value: -85,
        date: DateTime.now()
            .subtract(const Duration(days: 1))
            .millisecondsSinceEpoch,
      ),
      TransactionModel(
        id: '3',
        title: 'Paypal',
        value: 1460,
        date: DateTime.now()
            .subtract(const Duration(days: 5))
            .millisecondsSinceEpoch,
      ),
      TransactionModel(
        id: '4',
        title: 'YouTube',
        value: -11.99,
        date: DateTime.now()
            .subtract(const Duration(days: 7))
            .millisecondsSinceEpoch,
      ),
    ];
  }
}

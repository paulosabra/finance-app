import 'package:flutter/foundation.dart';
import 'package:mono/src/features/home/widgets/balance_card/balance_card_state.dart';
import 'package:mono/src/model/balance_model.dart';
import 'package:mono/src/repositories/transaction/transaction_repository.dart';

class BalanceCardController extends ChangeNotifier {
  BalanceCardController({
    required this.repository,
  });
  final TransactionRepository repository;

  BalanceCardState _state = BalanceCardInitialState();

  BalanceCardState get state => _state;

  BalanceModel? _balance;
  BalanceModel? get balance => _balance;

  void _emit(BalanceCardState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getBalance() async {
    _emit(BalanceCardLoadingState());
    try {
      _balance = await repository.getBalance();
      _emit(BalanceCardSuccessState());
    } catch (error) {
      _emit(BalanceCardErrorState(error.toString()));
    }
  }
}

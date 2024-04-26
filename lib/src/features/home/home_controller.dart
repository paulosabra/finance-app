import 'package:flutter/foundation.dart';
import 'package:mono/src/features/home/home_state.dart';
import 'package:mono/src/model/transaction_model.dart';
import 'package:mono/src/repositories/transaction/transaction_repository.dart';

class HomeController extends ChangeNotifier {
  HomeController({
    required this.repository,
  });
  final TransactionRepository repository;

  HomeState _state = HomeInitialState();

  HomeState get state => _state;

  Transactions _transactions = [];
  Transactions get transactions => _transactions;

  void _emit(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> getAllTransactions() async {
    _emit(HomeLoadingState());
    try {
      _transactions = await repository.getAllTransactions();
      _emit(HomeSuccessState());
    } catch (error) {
      _emit(HomeErrorState(error.toString()));
    }
  }
}

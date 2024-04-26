abstract class BalanceCardState {}

class BalanceCardInitialState extends BalanceCardState {}

class BalanceCardLoadingState extends BalanceCardState {}

class BalanceCardSuccessState extends BalanceCardState {}

class BalanceCardErrorState extends BalanceCardState {
  BalanceCardErrorState(this.message);
  final String? message;
}

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  HomeSuccessState();
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.message);
  final String? message;
}

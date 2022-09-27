part of 'shows_cubit.dart';

@immutable
abstract class ShowsState {}

class ShowsInitial extends ShowsState {}

class ShowsLoading extends ShowsState {}

class ShowsLoaded extends ShowsState {
  final List<ShowEntity> shows;

  ShowsLoaded({required this.shows});
}

class ShowsErrorLoading extends ShowsState {
  final String message;

  ShowsErrorLoading({required this.message});
}

class ListOrdersChanged extends ShowsState {
  final List<ItemOrdened> ordens;

  ListOrdersChanged({required this.ordens});
}

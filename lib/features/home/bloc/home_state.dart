part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  HomeSuccess({required this.allSongs});

  final List<Song> allSongs;
}

class HomeRefreshing extends HomeState {
  HomeRefreshing({required this.allSongs});

  final List<Song> allSongs;
}

class HomeError extends HomeState {
  HomeError({required this.errors});

  final Map<String, dynamic> errors;
}

class HomeRefreshError extends HomeState {
  HomeRefreshError({
    required this.errors,
    required this.cashedAllSongs,
  });

  final Map<String, dynamic> errors;
  final List<Song>? cashedAllSongs;
}

import 'dart:async';

import 'package:arabiamusic_app/core/error/server_failure.dart';
import 'package:arabiamusic_app/core/error/success.dart';
import 'package:arabiamusic_app/core/util/other/toast_util.dart';
import 'package:arabiamusic_app/features/home/model/song.dart';
import 'package:arabiamusic_app/features/home/network/home_network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetAllSongs>(_getData);
    on<RefreshAllSongs>(_getData);
  }

  List<Song>? _cachedAllSongs;

  Future<void> _getData(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    late HomeState state;
    if (event is RefreshAllSongs) {
      state = (_cachedAllSongs == null)
          ? HomeLoading()
          : HomeRefreshing(
              allSongs: _cachedAllSongs!,
            );
    } else {
      _cachedAllSongs = null;
      state = HomeLoading();
    }
    emit(state);
    try {
      final songs = _getAllSongs();
      state = HomeSuccess(
        allSongs: await songs,
      );
    } on ServerFailure catch (failure) {
      unawaited(
        ToastUtil.showToast(
          msg: failure.errors.values.first.toString(),
        ),
      );
      final errors = failure.errors;
      state = event is RefreshAllSongs
          ? HomeRefreshError(
              cashedAllSongs: _cachedAllSongs,
              errors: errors,
            )
          : HomeError(errors: errors);
    } on Exception catch (e) {
      unawaited(
        ToastUtil.showToast(
          msg: e.toString(),
        ),
      );
      final errors = {'message': e.toString()};
      state = event is RefreshAllSongs
          ? HomeRefreshError(cashedAllSongs: _cachedAllSongs, errors: errors)
          : HomeError(errors: errors);
      state = HomeError(errors: errors);
    }
    emit(state);
  }

  Future<List<Song>> _getAllSongs() async {
    late List<Song> allSongs;
    final networkResult = await HomeNetwork.getAllSongs();
    networkResult.fold((ServerFailure failure) {
      throw failure;
    }, (Success success) {
      final data = success.data;
      if (data != null) {
        final listOfSongs = data['data'] as List;
        final responseSongs = listOfSongs
            .map<Song>(
              (json) => Song.fromJson(json as Map<String, dynamic>),
            )
            .toList();
        _cachedAllSongs = responseSongs;
        allSongs = responseSongs;
      } else {
        throw Exception('all songs data is null');
      }
    });
    return allSongs;
  }
}

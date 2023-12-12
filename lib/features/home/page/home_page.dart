import 'package:arabiamusic_app/core/data/config.dart';
import 'package:arabiamusic_app/core/widgets/arabia_music_app_bar.dart';
import 'package:arabiamusic_app/core/widgets/arabia_music_card.dart';
import 'package:arabiamusic_app/core/widgets/shimmer_list.dart';
import 'package:arabiamusic_app/features/home/bloc/home_bloc.dart';
import 'package:arabiamusic_app/features/home/model/song.dart';
import 'package:arabiamusic_app/features/home/widget/mini_player.dart';
import 'package:arabiamusic_app/features/home/widget/song_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const ArabiaMusicAppBar(
          title: 'ALL SONGS',
        ),
        body: Stack(
          children: [
            BlocProvider(
              create: (context) => HomeBloc()..add(GetAllSongs()),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: _allSongsBody,
              ),
            ),
            if (Config().nowPlaying != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: MiniPlayer(),
              ),
          ],
        ),
      );

  Widget _allSongsBody(BuildContext context, HomeState state) {
    late final List<Song> cashedAllSongs;
    switch (state.runtimeType) {
      case HomeSuccess:
        cashedAllSongs = (state as HomeSuccess).allSongs;
        return cashedAllSongs.isNotEmpty
            ? _allSongsList(context, cashedAllSongs)
            : _emptyAllSongs(context);
      case HomeError:
        return _errorView(context);
      case HomeRefreshError:
        cashedAllSongs = (state as HomeRefreshError).cashedAllSongs ?? [];
        return cashedAllSongs.isNotEmpty
            ? _allSongsList(context, cashedAllSongs)
            : _emptyAllSongs(context);
      default:
        return const ShimmerList();
    }
  }

  ListView _errorView(BuildContext context) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          ArabiaMusicCard(
            imagePath: 'assets/images/error.png',
            title: 'Something went wrong!',
            onButtonPressed: () => _getAllSongs(context),
            buttonTitle: 'Try Again',
          ),
        ],
      );

  RefreshIndicator _allSongsList(
    BuildContext context,
    List<Song> allSongs,
  ) =>
      RefreshIndicator(
        onRefresh: () => _refreshAllSongs(context),
        child: ListView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: allSongs.length,
              itemBuilder: (context, index) => SongListItem(
                song: allSongs[index],
                changeNowPlaying: _changeNowPlaying,
              ),
            ),
            if (Config().nowPlaying != null)
              const SizedBox(
                height: 80,
              ),
          ],
        ),
      );

  RefreshIndicator _emptyAllSongs(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshAllSongs(context),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          ArabiaMusicCard(
            imagePath: 'assets/images/empty.png',
            title: 'There is no songs!',
            subtitle: 'Pull to refresh',
          ),
        ],
      ),
    );
  }

  Future<void> _getAllSongs(BuildContext context) async =>
      BlocProvider.of<HomeBloc>(context).add(GetAllSongs());

  Future<void> _refreshAllSongs(BuildContext context) async {
    final profileBloc = BlocProvider.of<HomeBloc>(context)
      ..add(RefreshAllSongs());
    await for (final result in profileBloc.stream) {
      if (result is HomeSuccess || result is HomeError) return;
    }
  }

  void _changeNowPlaying(Song song) {
    setState(() {
      if (Config().nowPlaying != null && Config().nowPlaying == song) {
        Config().nowPlaying = null;
      } else {
        Config().nowPlaying = song;
      }
    });
  }
}

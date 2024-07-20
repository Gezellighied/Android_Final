// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_application_1/enum/LoadStatus.dart';
import 'package:flutter_application_1/model/Product.dart';
import 'package:flutter_application_1/model/game.dart';

class MainState {
    final LoadStatus loadStatus;
    final List<Game> games;
  MainState({
    required this.loadStatus,
    required this.games,
  });

MainState copyWith({LoadStatus? loadStatus, List<Game>? games}) {
    return MainState(
      loadStatus: loadStatus ?? this.loadStatus,
      games: games ?? this.games,
    );
  }
  factory MainState.Init() {
    return MainState(loadStatus: LoadStatus.Init, games: const []);
  }
}



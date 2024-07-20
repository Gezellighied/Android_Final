// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/enum/LoadStatus.dart';
import 'package:flutter_application_1/model/Product.dart';
import 'package:flutter_application_1/model/game.dart';
import 'package:flutter_application_1/model/gameDetail';

class DetailState {
  final LoadStatus loadStatus;
  final Game game;
  DetailState({
    required this.loadStatus,
    required this.game,
  });
   

  DetailState copyWith({
    LoadStatus? loadStatus,
    Game? game,
  }) {
    return DetailState(
      loadStatus: loadStatus ?? this.loadStatus,
      game: game ?? this.game,
    );
  }
  factory DetailState.Init(){
    return DetailState(loadStatus: LoadStatus.Init, game: Game());
  }
}



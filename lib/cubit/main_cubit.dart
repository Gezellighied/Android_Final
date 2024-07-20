import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/cubit/main_state.dart';
import 'package:flutter_application_1/enum/LoadStatus.dart';
import 'package:meta/meta.dart';



class MainCubit extends Cubit<MainState> {
  final Api api;
  MainCubit(this.api) : super (MainState.Init());

  Future<void> getData() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.getListGame();
      emit(state.copyWith(loadStatus: LoadStatus.Done, games: data));
    } catch (e){{
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }}
  }
}




import 'package:flutter_application_1/screen/sort/cubit/sort_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api.dart';
import '../../../enum/LoadStatus.dart';

class SortCubit extends Cubit<SortState> {
  final Api api;
  SortCubit(this.api) : super(SortState.Init());

  void getNewGame() async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data = await api.getGameNew();
      emit(state.copyWith(loadStatus: LoadStatus.Done, gamenews: data));
    } catch (e) {
      print(e);
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
}
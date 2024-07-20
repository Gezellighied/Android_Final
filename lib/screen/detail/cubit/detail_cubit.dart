
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/enum/LoadStatus.dart';
import 'package:flutter_application_1/screen/detail/cubit/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCubit extends Cubit<DetailState> {
  final Api api;
  DetailCubit(this.api) : super(DetailState.Init());
  
  Future<void> getdetail(int id ) async {
    emit(state.copyWith(loadStatus: LoadStatus.Loading));
    try {
      final data =await api.getDetailGame(id);
      emit(state.copyWith(loadStatus: LoadStatus.Done, game: data));
    }catch (e) {
      print("${e} loi cho getDetail");
      emit(state.copyWith(loadStatus: LoadStatus.Error));
    }
  }
}

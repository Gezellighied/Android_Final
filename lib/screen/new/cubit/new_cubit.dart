import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_state.dart';

class NewCubit extends Cubit<NewState> {
  NewCubit() : super(NewInitial());
}

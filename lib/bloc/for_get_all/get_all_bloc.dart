import 'package:bloc/bloc.dart';
import 'package:bloc_copy_with_method/bloc/bloc_status.dart';
import 'package:bloc_copy_with_method/const.dart';

part 'get_all_event.dart';

part 'get_all_state.dart';

class GetAllBloc extends Bloc<GetAllEvent, GetAllState> {
  GetAllBloc() : super(GetAllState(blocStatus: BlocStatus.NONE)) {
    on<GetAllEvent>((event, emit) async {
      emit(GetAllState(blocStatus: BlocStatus.LOADING));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(blocStatus: BlocStatus.LOADED));
    });
  }
}

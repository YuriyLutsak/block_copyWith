import 'package:bloc/bloc.dart';
import 'package:bloc_copy_with_method/bloc/bloc_status.dart';
import 'package:bloc_copy_with_method/const.dart';
import 'package:meta/meta.dart';

part 'my_event.dart';

part 'my_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(MyState(blocStatus: BlocStatus.NONE)) {
    on<GetByIdEvent>((event, emit) async {
      emit(MyState(blocStatus: BlocStatus.LOADING));
      await Future.delayed(const Duration(seconds: 1));

      if (event.id < kList.length && event.id >= 0) {
        emit(
          state.copyWith(
              blocStatus: BlocStatus.LOADED, entity: kList[event.id]),
        );
      } else {
        emit(
          state.copyWith(
              blocStatus: BlocStatus.ERROR, error: 'error from state'),
        );
      }
    });
    on<DeleteByIdEvent>((event, emit) {
      if (event.id < kList.length && event.id >= 0) {
        emit(state.copyWith(
            blocStatus: BlocStatus.ERROR,
            error: '${kList[event.id]} you just deleted'));
        kList.remove(kList[event.id]);
      } else {
        emit(state.copyWith(blocStatus: BlocStatus.ERROR, error: 'no such id'));
      }
    });
    on<PostEvent>((event, emit) {
      kList.add(event.newEntity);
      emit(state.copyWith(
          blocStatus: BlocStatus.LOADED, entity: event.newEntity));
    });
    on<DeleteAllEvent>((event, emit) {
      kList.clear();
      emit(state.copyWith(blocStatus: BlocStatus.ERROR, error: 'all deleted'));
    });

    on<RollBackEvent>(
        (event, emit) => emit(state.copyWith(blocStatus: BlocStatus.NONE)));
  }
}

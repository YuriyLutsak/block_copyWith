part of 'my_bloc.dart';

class MyState {
  final BlocStatus blocStatus;

  final String? entity;

  final String? error;

  MyState({required this.blocStatus, this.entity, this.error});

  MyState copyWith({required BlocStatus blocStatus, String? entity, String? error}) {
    return MyState(blocStatus: blocStatus, entity: entity, error: error);
  }
}

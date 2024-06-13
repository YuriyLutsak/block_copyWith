part of 'get_all_bloc.dart';

final class GetAllState {
  final BlocStatus blocStatus;
  final List<String>? entityList;
  final String? error;

  GetAllState({required this.blocStatus, this.entityList, this.error});

  GetAllState copyWith(
      {required BlocStatus blocStatus, List<String>? entities, String? error}) {
    return GetAllState(
        blocStatus: blocStatus, entityList: entities, error: error);
  }
}

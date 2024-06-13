part of 'my_bloc.dart';

@immutable
sealed class MyEvent {}

final class GetByIdEvent extends MyEvent {
  final int id;

  GetByIdEvent({required this.id});
}

final class DeleteByIdEvent extends MyEvent {
  final int id;

  DeleteByIdEvent({required this.id});
}

final class PostEvent extends MyEvent {
  final String newEntity;

  PostEvent({required this.newEntity});
}

final class DeleteAllEvent extends MyEvent {}

final class RollBackEvent extends MyEvent {}

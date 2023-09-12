part of 'room_cubit.dart';

abstract class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

class RoomInitial extends RoomState {}

class RoomLoading extends RoomState {}

class RoomLoaded extends RoomState {
  final List<RoomMl> postList;

  const RoomLoaded({
    required this.postList,
  });

  @override
  List<Object> get props => [postList];
}
// class RoomLoadedBy extends RoomState {
//   final List<RoomMl> optListBy;

//   const RoomLoadedBy({
//     required this.optListBy,
//   });

//   @override
//   List<Object> get props => [optListBy];
// }
class RoomError extends RoomState {
  final Failure failure;

  const RoomError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}

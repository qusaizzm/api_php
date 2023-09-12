part of 'room_cust_cubit.dart';

abstract class RoomCustState extends Equatable {
  const RoomCustState();

  @override
  List<Object> get props => [];
}

class RoomCustInitial extends RoomCustState {}

class RoomCustLoading extends RoomCustState {}

class RoomCustLoaded extends RoomCustState {
  final List<RoomCustMl> postList;

  const RoomCustLoaded({
    required this.postList,
  });

  @override
  List<Object> get props => [postList];
}

class RoomCustError extends RoomCustState {
  final Failure failure;

  const RoomCustError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}

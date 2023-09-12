part of 'op_cubit.dart';

abstract class OpState extends Equatable {
  const OpState();

  @override
  List<Object> get props => [];
}

class OpInitial extends OpState {}

class OpLoading extends OpState {}

class OpSuccess extends OpState {
  final List<OPMll> postList;

  const OpSuccess({
    required this.postList,
  });

  @override
  List<Object> get props => [postList];
}
class OpLoadedBy extends OpState {
  final List<OPMll> optListBy;

  const OpLoadedBy({
    required this.optListBy,
  });

  @override
  List<Object> get props => [optListBy];
}
class OpError extends OpState {
  final Failure failure;

  const OpError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}

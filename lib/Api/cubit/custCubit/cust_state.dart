part of 'cust_cubit.dart';

abstract class CustState extends Equatable {
  const CustState();

  @override
  List<Object> get props => [];
}

class CustInitial extends CustState {}

class CustLoading extends CustState {}

class CustLoaded extends CustState {
  final List<CustMl> postList;

  const CustLoaded({
    required this.postList,
  });

  @override
  List<Object> get props => [postList];
}

class CustError extends CustState {
  final Failure failure;

  const CustError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nsjsds_state.dart';

class NsjsdsCubit extends Cubit<NsjsdsState> {
  NsjsdsCubit() : super(NsjsdsInitial());
}

import 'package:api_php/Api/model/failure_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/model/room_model.dart';
import 'package:api_php/Api/rep/api_rop.dart'; 

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  final ApiRepository apiRepository;
  RoomCubit({required this.apiRepository}) : super(RoomInitial());

  Future<void> fetchRoomAll() async {
    emit(RoomLoading());
    int feeSum = 0;
    try {
      final List<RoomMl>? postList = await apiRepository.getRoombyStock(roomStock);
      postList?.forEach((RoomMl val) {
        feeSum += int.parse(val.total.toString());
      });
      stockTotal = feeSum;
      print("feeSum $feeSum");
      emit(RoomLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(RoomError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }
}

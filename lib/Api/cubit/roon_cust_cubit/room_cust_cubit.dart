import 'package:api_php/Api/model/failure_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart'; 
import 'package:api_php/Api/model/Room_cust_model.dart';
import 'package:api_php/Api/rep/api_rop.dart';
import 'package:api_php/Api/service/api_service.dart';


part 'room_cust_state.dart';

class RoomCustCubit extends Cubit<RoomCustState> {
  // final ApiRepository apiRepository;
  // RoomCustCubit() : super(RoomCustInitial());
  RoomCustCubit() : super(RoomCustInitial());

  Future<void> fetchRoomCust(room) async {
    ApiService apiService = ApiService();

    ApiRepository apiRepository = ApiRepository(apiService: apiService);
    int feeSum = 0;
    emit(RoomCustLoading());
    try {
      // final List<RoomCustMl>? postList =
          // await apiRepository.getCustRoom(room: roomName);
         
      final List<RoomCustMl>? postList =
          await apiRepository.getCustRoom(room: room);
      // postList?.forEach((RoomCustMl val) {
      //   feeSum += int.parse(val..toString());
      // });
      // feeSumTotal = feeSum;
      print("feeSum $feeSum");
      emit(RoomCustLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(RoomCustError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }
}

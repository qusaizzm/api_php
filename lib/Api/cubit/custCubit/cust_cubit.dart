import 'package:api_php/Api/model/failure_model.dart';
import 'package:equatable/equatable.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/model/cust_model.dart';
import 'package:api_php/Api/rep/api_rop.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

part 'cust_state.dart';

class CustCubit extends Cubit<CustState> {
  final ApiRepository apiRepository;
  CustCubit({required this.apiRepository}) : super(CustInitial());

  Future<void> fetchCustAll() async {
    emit(CustLoading());
    int feeSum = 0;
    try {
      final List<CustMl>? postList = await apiRepository.getCustAll();
      postList?.forEach((CustMl val) {
        feeSum += int.parse(val.total.toString());
      });
      custsTotal = feeSum;
      print("feeSum $feeSum");
      emit(CustLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(CustError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }

  Future<void> fetchCustbyName() async {
    int feeSum = 0;

    emit(CustLoading());
    try {
      final List<CustMl>? postList = await apiRepository.getCustByName();
      postList?.forEach((CustMl val) {
        feeSum += int.parse(val.total.toString());
      });
      custsTotalByName = feeSum;
      print("custsTotalByName $custsTotalByName");
      emit(CustLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(CustError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }

  Future<void> fetchCustbyRoom() async {
    int feeSum = 0;

    emit(CustLoading());
    try {
      final List<CustMl>? postList =
          await apiRepository.getCustByRoom(room: roomName);
      // postList?.forEach((CustMl val) {
      //   feeSum += int.parse(val.total.toString());
      // });
      // custsTotalByName = feeSum;
      // print("custsTotalByName $custsTotalByName");
      emit(CustLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(CustError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }
}

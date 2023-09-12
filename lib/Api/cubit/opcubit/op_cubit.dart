import 'package:api_php/Api/model/failure_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:api_php/Api/model/op_model.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/rep/api_rop.dart';
import 'package:intl/intl.dart';

part 'op_state.dart';

class getDate {
  static var formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
}

class OpCubit extends Cubit<OpState> {
  final ApiRepository apiRepository;
  OpCubit({required this.apiRepository}) : super(OpInitial());

  Future<void> fetchOp() async {
    int feeSum = 0;
    emit(OpLoading());
    try {
      final List<OPMll>? postList = await apiRepository.getOpAll();
      print("postList+postList" + postList.toString());
      postList?.forEach((OPMll val) {
        feeSum += int.parse(val.countsOp.toString());
      });
      feeSumTotal = feeSum;
      emit(OpSuccess(postList: postList!));
    } on Failure catch (err) {
      emit(OpError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }

  Future<void> fetchOpbyData() async {
    int feeSum = 0;
    emit(OpLoading());
    try {
      final List<OPMll>? postList =
          await apiRepository.getOpByDate(formaDateNow);
      postList?.forEach((OPMll val) {
        feeSum += int.parse(val.countsOp.toString());
      });
      feeSumTotal = feeSum;
      print("feeSum $feeSum");
      emit(OpSuccess(postList: postList ?? []));
    } on Failure catch (err) {
      emit(OpError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }

  Future<void> fetchOpbyName(name) async {
    int feeSum = 0;
    emit(OpLoading());
    try {
      final List<OPMll>? postList = await apiRepository.getOpByName(name: name);
      postList?.forEach((OPMll val) {
        feeSum += int.parse(val.countsOp.toString());
      });
      feeSumTotal = feeSum;
      print("feeSum $feeSum");
      emit(OpLoadedBy(optListBy: postList ?? []));
    } on Failure catch (err) {
      emit(OpError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }
}

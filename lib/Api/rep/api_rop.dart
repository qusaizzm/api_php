import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/model/Room_cust_model.dart';
import 'package:api_php/Api/model/cust_model.dart';
import 'package:api_php/Api/model/op_model.dart';
import 'package:api_php/Api/model/room_model.dart';
import 'package:api_php/Api/service/api_service.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiService apiService;
//  ******************** Start Oparetion
  Future<List<OPMll>?> getOpAll() async {
    final response = await apiService.getOpData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      print(response.data);
      var rusult = data.map((singlePost) => OPMll.fromMap(singlePost)).toList();

      return rusult;
    }
  }

  Future<List<OPMll>?> getOpByDate(date) async {
    final response = await apiService.getOpData();
    if (response != null) {
      final data = response.data as List<dynamic>;

      var rusult = data.map((singlePost) => OPMll.fromMap(singlePost)).toList();
      rusult = rusult
          .where(
              (element) => element.dateCreated!.toLowerCase().contains((date)))
          .toList();
      return rusult;
    }
  }

  Future<List<OPMll>?> getOpByName({name}) async {
    final response = await apiService.getOpData();
    if (response != null) {
      final data = response.data as List<dynamic>;

      var rusult = data.map((singlePost) => OPMll.fromMap(singlePost)).toList();
      rusult = rusult
          .where((element) => element.custname!.toLowerCase().contains((name)))
          .toList();
      return rusult;
    }
  }

//  ******************** Start Customer
  Future<List<CustMl>?> getCustAll() async {
    final response = await apiService.getCustData();
    if (response != null) {
      final data = response.data as List<dynamic>;

      var rusult =
          data.map((singlePost) => CustMl.fromMap(singlePost)).toList();

      return rusult;
    }
  }

  Future<List<CustMl>?> getCustByName({name}) async {
    final response = await apiService.getCustData();
    if (response != null) {
      final data = response.data as List<dynamic>;

      var rusult =
          data.map((singlePost) => CustMl.fromMap(singlePost)).toList();
      rusult = rusult
          .where((element) => element.custname!.toLowerCase().contains((name)))
          .toList();
      return rusult;
    }
  }

  Future<List<CustMl>?> getCustByRoom({room}) async {
    final response = await apiService.getCustData();
    if (response != null) {
      final data = response.data as List<dynamic>;

      var rusult =
          data.map((singlePost) => CustMl.fromMap(singlePost)).toList();
      rusult = rusult
          .where((element) => element.rooms!.toLowerCase().contains(room))
          .toList();
      print("rusult $rusult");
      return rusult;
    }
  }
//  ******************** Ende Customer

//  ******************** Start Room
  Future<List<RoomMl>?> getRoombyStock(stock) async {
    final response = await apiService.getRoomData();
    if (response != null) {
      final data = response.data as List<dynamic>;

      var rusult =
          data.map((singlePost) => RoomMl.fromMap(singlePost)).toList();
      rusult = rusult
          .where((element) => element.stock!.toLowerCase().contains((stock)))
          .toList();
      return rusult;
    }
  }

//  ******************** Strart Cust_Room
  Future<List<RoomCustMl>?> getCustRoom({room}) async {
    final response = await apiService.getCust_RoomData();
    if (response != null) {
      final data = response.data as List<dynamic>;

      var rusult =
          data.map((singlePost) => RoomCustMl.fromMap(singlePost)).toList();
      rusult =
          rusult.where((element) => element.room_no!.contains(room)).toList();
      return rusult;
    }
  }
//  ******************** End Cust_Room
}

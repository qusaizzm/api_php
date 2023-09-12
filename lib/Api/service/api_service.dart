import 'dart:io';

import 'package:api_php/Api/model/failure_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:fz_md01/apicubitPhp/models/failure_model.dart';
import 'package:api_php/Api/constants/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();
  DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
  Options myoptions =
      buildCacheOptions(const Duration(days: 30), forceRefresh: true);
  // var res = await dio.get(urlLink + url, options: myoptions);

  // String urlLink = 'https://purple-snow-01674.pktriot.net/flutter/02/';
  // String urlList = 'get_op.php/';

  Future<Response?> getOpData() async {
    try {
      _dio.interceptors.add(diocacheManger.interceptor);
      final Response? response =
          await _dio.get(baseUrlApi + opLINK, options: myoptions);
      return response;
    } on SocketException {
      throw const Failure(message: 'No Internet Connection');
    } catch (err) {
      print("object 1111111111111111111");
      print("Error :$err");
      print("kkkfkkkfkf :$err");
    }
  }

  Future<Response?> getCustData() async {
    try {
      _dio.interceptors.add(diocacheManger.interceptor);
      final Response? response =
          await _dio.get(baseUrlApi + custLINK, options: myoptions);
      return response;
    } on SocketException {
      throw const Failure(message: 'No Internet Connection');
    } catch (err) {
      print("Error :$err");
    }
  }
 
  Future<Response?> getRoomData() async {
    try {
      _dio.interceptors.add(diocacheManger.interceptor);
      final Response? response =
          await _dio.get(baseUrlApi + roomLINK, options: myoptions);
      return response;
    } on SocketException {
      throw const Failure(message: 'No Internet Connection');
    } catch (err) {
      print("Error :$err");
    }
  }


  Future<Response?> getCust_RoomData() async {
    try {
      _dio.interceptors.add(diocacheManger.interceptor);
      final Response? response =
          await _dio.get(baseUrlApi + cust_roomLINK, options: myoptions);
      return response;
    } on SocketException {
      throw const Failure(message: 'No Internet Connection');
    } catch (err) {
      print("object 1111111111111111111");
      print("Error :$err");
      print("kkkfkkkfkf :$err");
    }
  }
}

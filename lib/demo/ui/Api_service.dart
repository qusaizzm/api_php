// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:fz_md01/php/model/cust_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// import '../model/op_model.dart';

// String onlineGloble = "";
// // String urlLink = 'http://192.168.43.192/flutter_php/04/';
// String urlLink = 'https://purple-snow-01674.pktriot.net/flutter/02/';

// class getDate {
//   static var formattedDate = DateFormat('yyyy/MM/dd').format(DateTime.now());
// }

// // class FetchUserList {
// //   var data = [];
// //   List<OPModel> results = [];
// //   String urlList = 'get_op.php/';
// //   Future<List<OPModel>> getuserList() async {
// //     // Future<List<OPModel>> getuserList({String? query}) async {
// //     var url = Uri.parse(urlLink + urlList);
// //     try {
// //       var response = await http.get(url);
// //       if (response.statusCode == 200) {
// //         data = json.decode(response.body);
// //         results = data.map((e) => OPModel.fromJson(e)).toList();
// //         onlineGloble = "online";

// //         // if (results.isNotEmpty) {
// //         //   print("online ");
// //         // } else {
// //         //   print("offline ");
// //         // }
// //         // if (query != null) {
// //         //   results = results
// //         //       .where((element) => element.custname!
// //         //           .toLowerCase()
// //         //           .contains((query.toLowerCase())))
// //         //       .toList();
// //         // }
// //       } else {
// //         print("fetch error");
// //       }
// //     } on Exception catch (e) {
// //       print('error: $e');
// //     }
// //     return results;
// //   }
// // }

// class CustomerController {
//   static int sumTotal = 0;

//   static Future<List<OPModel>?> getOP() async {
//     String url = 'get_op.php/';

//     // String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/$urlPath";

//     List<OPModel> result = [];
//     try {
//       Dio dio = Dio();
//       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
//       Options myoptions =
//           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
//       dio.interceptors.add(diocacheManger.interceptor);
//       var res = await dio.get(urlLink + url, options: myoptions);
//       result = opList(res.data);
//     } catch (e) {
//       return null;
//     }
//     return result;
//   }

//   static Future<List<OPModel>?> getOPByDate({required date}) async {
//     // String url = 'http://192.168.43.192/flutter_php/04/get_op.php';
//     String url = 'get_op.php';

//     // String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/$urlPath";
//     int feeSum = 0;
//     List<OPModel> result = [];
//     try {
//       Dio dio = Dio();
//       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
//       Options myoptions =
//           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
//       dio.interceptors.add(diocacheManger.interceptor);
//       var res = await dio.get(urlLink + url, options: myoptions);

//       result = opList(res.data);
//       result.forEach((OPModel val) {
//         feeSum += int.parse(val.countsOp.toString());
//       });

//       sumTotal = feeSum;
//       // for (OPModel elem in result) {
//       //   feeSum += elem.countsOp;
//       // }
//       // print("feeSum 23 " + feeSum.toString());
//       // print("sumTotal34 " + sumTotal.toString());

//       result = result
//           .where(
//               (element) => element.dateCreated!.toLowerCase().contains((date)))
//           .toList();
//     } catch (e) {
//       return null;
//     }
//     return result;
//   }

//   static Future<List<OPModel>?> getOPByName({required date}) async {
//     String url = 'http://192.168.43.192/flutter_php/04/get_op.php';

//     // String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/$urlPath";

//     List<OPModel> result = [];
//     try {
//       Dio dio = Dio();
//       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
//       Options myoptions =
//           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
//       dio.interceptors.add(diocacheManger.interceptor);
//       var res = await dio.get(url, options: myoptions);
//       result = opList(res.data);
//       result = result
//           .where((element) => element.custname!.toLowerCase().contains((date)))
//           .toList();
//     } catch (e) {
//       return null;
//     }
//     return result;
//   }

//   static Future<List<OPModel>?> sumTotalOP() async {
//     String url = 'http://192.168.43.192/flutter_php/04/get_op.php';

//     // String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/$urlPath";
//     int feeSum = 0;
//     List<OPModel> result = [];
//     try {
//       Dio dio = Dio();
//       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
//       Options myoptions =
//           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
//       dio.interceptors.add(diocacheManger.interceptor);
//       var res = await dio.get(url, options: myoptions);
//       result = opList(res.data);
//       result.forEach((OPModel val) {
//         feeSum += int.parse(val.countsOp.toString());
//       });

//       sumTotal = feeSum;
//       // for (OPModel elem in result) {
//       //   feeSum += elem.countsOp;
//       // }
//       print("feeSum " + feeSum.toString());
//       print("sumTotal " + sumTotal.toString());
//       // result = result
//       //     .where((element) => element.countsOp!.toLowerCase().contains((date)))
//       //     .toList();
//     } catch (e) {
//       return null;
//     }
//     return result;
//   }

//   static Future<List<CustModel>?> getCust() async {
//     String url = "get_custo.php";
//     List<CustModel> result = [];
//     try {
//       Dio dio = Dio();
//       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
//       Options myoptions =
//           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
//       dio.interceptors.add(diocacheManger.interceptor);
//       var res = await dio.get(urlLink + url, options: myoptions);
//       //print(res);
//       result = custList(res.data);
//     } catch (e) {
//       return null;
//     }
//     return result;
//   }

//   static Future<List<CustModel>?> getCustByName({required date}) async {
//     String url = "get_custo.php";

//     // String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/$urlPath";

//     List<CustModel> result = [];
//     try {
//       Dio dio = Dio();
//       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
//       Options myoptions =
//           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
//       dio.interceptors.add(diocacheManger.interceptor);
//       var res = await dio.get(urlLink + url, options: myoptions);
//       result = custList(res.data);
//       result = result
//           .where((element) => element.custname!.toLowerCase().contains((date)))
//           .toList();
//     } catch (e) {
//       return null;
//     }
//     return result;
//   }

//   static opList(body) {
//     List<OPModel> cust = [];
//     List x = (body);
//     x.forEach((element) {
//       cust.add(OPModel.fromJson(element));
//     });
//     return cust;
//   }

//   static custList(body) {
//     List<CustModel> cust = [];
//     List x = (body);
//     x.forEach((element) {
//       cust.add(CustModel.fromJson(element));
//     });
//     return cust;
//   }
// }

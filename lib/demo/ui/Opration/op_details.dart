// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fz_md01/12/view/widgets/icon_button_widget.dart';

// import '../../model/op_model.dart';
// import '../Api_service.dart';

// class OparetionDetails extends StatefulWidget {
// final OPModel data;

//   const OparetionDetails({Key? key, required this.data}) : super(key: key);
//   @override
//   State<OparetionDetails> createState() => _OparetionDetailsState();
// }

// class _OparetionDetailsState extends State<OparetionDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تفاصيل العمليات'),
//       ),
//       body: FutureBuilder(
//         future: CustomerController.getOP(),
//         builder: (context, AsyncSnapshot<List<OPModel>?> snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data!.isNotEmpty) {
//               RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
//               String Function(Match) mathFunc =
//                   (Match match) => '${match[1]},';
//               return Column(
//                 children: [
//                    ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(widget.data.custname!),
//                               Text(widget.data.countsOp!
//                                   .toString()
//                                   .replaceAllMapped(reg, mathFunc)),
//                             ],
//                           ),
//                           subtitle: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("السواق: " + widget.data.person!),
//                               Text(widget.data.dateCreated!),
//                             ],
//                           ),
//                         )
                 


//                 ],
//               );
//             } else {
//               return Text("NO Data Found");
//             }
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

// // class CustomerController {
// //   static Future<List<OPModel>?> getAll() async {
// //     String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/get_op.php";
// //     List<OPModel> result = [];
// //     try {
// //       Dio dio = Dio();
// //       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
// //       Options myoptions =
// //           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
// //       dio.interceptors.add(diocacheManger.interceptor);
// //       var res = await dio.get(url, options: myoptions);
// //       result = getList(res.data);
// //     } catch (e) {
// //       return null;
// //     }
// //     return result;
// //   }

// //   static getList(body) {
// //     List<OPModel> cust = [];
// //     List x = (body);
// //     x.forEach((element) {
// //       cust.add(OPModel.fromJson(element));
// //     });
// //     return cust;
// //   }
// // }

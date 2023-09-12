// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';

// import '../../model/op_model.dart';
// import '../Api_service.dart';

// class CustomerDetails extends StatefulWidget {
//   final data;

//   const CustomerDetails({Key? key, required this.data}) : super(key: key);
//   @override
//   State<CustomerDetails> createState() => _CustomerDetailsState();
// }

// class _CustomerDetailsState extends State<CustomerDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: CustomerController.getOPByName(date: widget.data),
//         builder: (context, AsyncSnapshot<List<OPModel>?> snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data!.isNotEmpty) {
//               RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
//               String Function(Match) mathFunc = (Match match) => '${match[1]},';
//               return Column(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.all(10),
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         children: [
//                           newMethod(txt: "العدد", fontSizeNO: 18.0),
//                           newMethod(txt: "الماركه", fontSizeNO: 18.0),
//                           newMethod(txt: "الغرفه", fontSizeNO: 18.0),
//                           newMethod(txt: "السواق", fontSizeNO: 18.0),
//                           newMethod(txt: "التاريخ", fontSizeNO: 18.0),
//                         ],
//                       )),
//                   Expanded(
//                     child: ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) {
//                           var _da = snapshot.data![index];
//                           // final DateTime now = DateTime.now();
//                           // final DateFormat formatter = DateFormat('yyyy-MM-dd');
//                           // final String formatted = formatter.format(now);
//                           var dateString; //= //"25/04/2020";
//                           var dateTime = DateFormat('yyyy/MM/dd')
//                               .parse(_da.dateCreated.toString());
//                           dateString = DateFormat('dd/MMM ').format(dateTime);
//                           // print(dateString);

//                           // print(formatted);

//                           return Container(
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 // color: Colors.deepPurpleAccent,
//                                 borderRadius: BorderRadius.circular(4),
//                                 // boxShadow: [
//                                 //   BoxShadow(
//                                 //       spreadRadius: 1,
//                                 //       color: Colors.black,
//                                 //       blurRadius: 1,
//                                 //       offset: Offset(0, 0))
//                                 // ],
//                               ),
//                               padding: EdgeInsets.all(5),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     height: double.infinity,
//                                     width: 5,
//                                     decoration: BoxDecoration(
//                                       color: _da.inOut == "in"
//                                           ? Colors.greenAccent
//                                           : Colors.redAccent,
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     padding: EdgeInsets.all(5),
//                                   ),
//                                   newMethod(txt: _da.countsOp!, fontSizeNO: 14),
//                                   newMethod(txt: _da.marks!),
//                                   newMethod(txt: _da.rooms!),
//                                   newMethod(
//                                       txt: _da.person!,
//                                       center: TextAlign.right),
//                                   newMethod(txt: dateString),
//                                   // _da.dateCreated!),
//                                 ],
//                               ));
//                         }),
//                   ),
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

//   Expanded newMethod({txt, double? fontSizeNO, TextAlign? center}) {
//     return Expanded(
//       child: Text(
//         txt,
//         textAlign: center ?? TextAlign.center,
//         style: fontSizeNO == null
//             ? null
//             : TextStyle(
//                 fontSize: fontSizeNO,
//                 fontWeight: FontWeight.bold,
//               ),
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

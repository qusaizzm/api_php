// import 'package:flutter/material.dart';
// import 'package:fz_md01/php/ui/Api_service.dart';
// import 'package:http/http.dart' as http;

// import '../../model/cust_model.dart';
// import '../search_op.dart';
// import 'cust_tab.dart';

// class CustomterPhpPage extends StatefulWidget {
//   const CustomterPhpPage({Key? key}) : super(key: key);

//   @override
//   State<CustomterPhpPage> createState() => _CustomterPhpPageState();
// }

// class _CustomterPhpPageState extends State<CustomterPhpPage> {
//   List userdata = [];
//   @override
//   void initState() {
//     super.initState();
//     // getdata();
//   }

//   // Future<void> getdata() async {
//   //   String url = "http://192.168.43.192/flutter_php/01/get_cust.php";
//   //   try {
//   //     var rws = await http.get(Uri.parse(url));
//   //     if (rws.statusCode == 200) {
//   //       setState(() {
//   //         userdata = jsonDecode(rws.body);
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('العملاء'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showSearch(context: context, delegate: SearchUser(page: "cust"));
//             },
//             icon: Icon(Icons.search_sharp),
//           )
//         ],
//       ),
//       body: FutureBuilder(
//         future: CustomerController.getCust(),
//         builder: (context, AsyncSnapshot<List<CustModel>?> snapshot) {
//           if (snapshot.hasData) {
//             if (snapshot.data!.isNotEmpty) {
//               RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
//               String Function(Match) mathFunc = (Match match) => '${match[1]},';
//               return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CustomerTab(
//                                     data: snapshot.data![index].custname)));
//                       },
//                       title: Text(snapshot.data![index].custname!),
//                       leading: Text("${index + 1}"),
//                       trailing: Text(snapshot.data![index].total!
//                           .toString()
//                           .replaceAllMapped(reg, mathFunc)),
//                       subtitle: snapshot.data![index].den == "0" ||
//                               snapshot.data![index].den == ""
//                           ? Text("")
//                           : Text(
//                               "الدين: " +
//                                   snapshot.data![index].den!
//                                       .replaceAllMapped(reg, mathFunc),
//                               style: TextStyle(color: Colors.red),
//                             ),
//                     );
//                   });
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
// //   static Future<List<CustModel>?> getAll() async {
// //     String url =
// //         "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/get_custo.php";
// //     List<CustModel> result = [];
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
// //     List<CustModel> cust = [];
// //     List x = (body);
// //     x.forEach((element) {
// //       cust.add(CustModel.fromJson(element));
// //     });
// //     return cust;
// //   }
// // }

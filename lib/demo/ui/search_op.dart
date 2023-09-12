// import 'package:api_php/Api/cubit/custCubit/cust_cubit.dart';
// import 'package:api_php/model/cust_model.dart';
// import 'package:api_php/model/op_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart'; 

// import '../Api/cubit/opcubit/op_cubit.dart';
// import 'Api_service.dart';

// class SearchUser extends SearchDelegate {
//   final page;
//   // FetchUserList _userList = FetchUserList();
//   // CustomerController _nameList = CustomerController();
//   SearchUser({this.page});

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: Icon(Icons.close))
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back_ios),
//       onPressed: () {
//         Navigator.pop(context);
//         print(page);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return page == "cust"
//         ? FutureBuilder<List<CustModel>?>(
//             future: 
//     BlocProvider.of<CustCubit>(context)..fetch(widget.data);
//             // CustomerController.getCustByName(date: query),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               List<CustModel>? data = snapshot.data;
//               return ListView.builder(
//                   itemCount: data?.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Row(
//                         children: [
//                           // Container(
//                           //   width: 60,
//                           //   height: 60,
//                           //   decoration: BoxDecoration(
//                           //     color: Colors.deepPurpleAccent,
//                           //     borderRadius: BorderRadius.circular(10),
//                           //   ),
//                           //   child: Center(
//                           //     child: Text(
//                           //       '${data?[index].custID}',
//                           //       style: TextStyle(
//                           //           fontSize: 20,
//                           //           fontWeight: FontWeight.bold,
//                           //           color: Colors.white),
//                           //       overflow: TextOverflow.clip,
//                           //     ),
//                           //   ),
//                           // ),
//                           SizedBox(width: 20),
//                           Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "lk: " + '${data?[index].custname}',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   '${data?[index].total}',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ])
//                         ],
//                       ),
//                     );
//                   });
//             })
//         : FutureBuilder<List<OPModel>?>(
//             future: CustomerController.getOPByName(date: query),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               List<OPModel>? data = snapshot.data;
//               return ListView.builder(
//                   itemCount: data?.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Row(
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 60,
//                             decoration: BoxDecoration(
//                               color: Colors.deepPurpleAccent,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 '${data?[index].itemID}',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                                 overflow: TextOverflow.clip,
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 20),
//                           Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "lk: " + '${data?[index].custname}',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   '${data?[index].countsOp}',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ])
//                         ],
//                       ),
//                     );
//                   });
//             });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Center(
//       child: Text('Search User !!'),
//     );
//   }
// }

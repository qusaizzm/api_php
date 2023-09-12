import 'package:api_php/Api/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_php/Api/model/op_model.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/cubit/opcubit/op_cubit.dart';
// import 'package:fz_md01/php/ui/Api_service.dart';
// import 'package:fz_md01/php/ui/search_op.dart';
// import 'package:fz_md01/php/ui/widget/date_now.dart';
// import 'package:fz_md01/sqlite/constants/constants.dart';

class OPHomePage extends StatefulWidget {
  final OPMll? data;
  const OPHomePage({Key? key, this.data}) : super(key: key);

  @override
  State<OPHomePage> createState() => _OPHomePageState();
}

class _OPHomePageState extends State<OPHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<OpCubit>(context)..fetchOp();

    // BlocProvider.of<OpCubit>(context)..fetchOpbyData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Text(
                //   getDate.formattedDate,
                //   textAlign: TextAlign.right,
                // ),
                // Container(height: 100, width: 100, child: DateFilter()),

                Center(
                  child: Column(
                    children: [
                      Text(
                        "العمليات",
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        height: 3,
                        width: 40,
                        color:
                            //  onlineGloble == "online"
                            //     ? Colors.green
                            //     :
                            Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            // showSearch(context: context, delegate: SearchUser(page: "op"));
            // showDialog(
            //     context: context,
            //     builder: (BuildContext cx) {
            //       return AlertDialog(
            //         title: Stack(
            //           children: [
            //             Positioned(
            //               right: 2,
            //               top: 2,
            //               child: InkWell(
            //                 onTap: () {
            //                   Navigator.pop(cx);
            //                 },
            //                 child: Container(
            //                   height: 30,
            //                   width: 30,
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(50),
            //                     color: Color.fromARGB(255, 221, 44, 44),
            //                   ),
            //                   child: Center(
            //                     child: const Icon(
            //                       Icons.close,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //             Column(
            //               children: [
            //                 Center(
            //                   child: Text(
            //                     "بحث",
            //                     style: TextStyle(
            //                         fontSize: 25,
            //                         letterSpacing: 2,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         content: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             // const Align(
            //             //     alignment: Alignment.topRight,
            //             //     child: Text('التاريخ')),
            //             ElevatedButton(
            //               style: Constants.customButtonStyle,
            //               onPressed: () {
            //                 Navigator.pop(cx);
            //                 showSearch(
            //                     context: context,
            //                     delegate: SearchUser(page: "op"));
            //               },
            //               child: const Text('بحث بالاسم'),
            //             ),
            //             const SizedBox(height: 10),
            //             DateFilter(),
            //             const SizedBox(height: 10),
            //           ],
            //         ),
            //         actions: [
            //           Center(
            //             child: ElevatedButton(
            //               style: Constants.customButtonStyle,
            //               onPressed: () async {
            //                 // _description.clear();
            //                 // ScaffoldMessenger.of(context)
            //                 //     .showSnackBar(const SnackBar(
            //                 // backgroundColor: Constants.primaryColor,
            //                 // duration: Duration(seconds: 1),
            //                 // content: Text("Added todo successfully"),
            //                 // ));
            //                 // setState(() {});
            //                 Navigator.pop(cx);
            //               },
            //               child: const Text('بحث '),
            //             ),
            //           ),
            //         ],
            //       );
            //     });
          },
          icon: Icon(Icons.search_sharp),
        ),
      ),
      body: Center(
        child: BlocBuilder<OpCubit, OpState>(
          builder: (context, state) {
            if (state is OpLoading) {
              return const CircularProgressIndicator();
            } else if (state is OpError) {
              return Text(state.failure.message);
            } else if (state is OpSuccess) {
              final postList = state.postList;
              return postList.isEmpty
                  ? const Text('لا توجد بيانات')
                  : OPCardWidget(data: postList);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class OPCardWidget extends StatelessWidget {
  final List<OPMll>? data;
  const OPCardWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _total = feeSumTotal.toString().replaceAllMapped(reg, mathFunc);
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
                border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Center(child: Text("الدخول")),
                    SizedBox(height: 10),
                    Center(
                      child: Text(_total),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Center(child: Text("السحب")),
                    SizedBox(height: 10),
                    Center(child: Text("0")),
                  ],
                ),
                Column(
                  children: [
                    Center(child: Text("الباقي")),
                    SizedBox(height: 10),
                    Center(child: Text("${_total}")),
                  ],
                ),
              ],
            )),
        Expanded(
          child: ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                var _da = data![index];
                return Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 5),
                            child: Text(
                              "${index + 1}",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _da.custname!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "السواق: " + _da.person!,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Spacer(),
                                  Container(
                                    child: Text(""),
                                  ),
                                  SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "الغرفه: " + _da.rooms!.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  _da.countsOp!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  _da.dateCreated!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 218, 217, 217),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ],
                  ),
                );
              }),
        )
      ],
    );

    // ListView.builder(
    //   padding: const EdgeInsets.all(10),
    //   itemCount: data.length,
    //   itemBuilder: (context, index) {
    //     final OPMll singlePost = data[index];
    //     return ListTile(
    //       leading: CircleAvatar(
    //         child: Text(singlePost.itemID.toString()),
    //       ),
    //       title: Text(singlePost.custname!),
    //       subtitle: Text(singlePost.countsOp!),
    //     );
    //   },
    // );
  }

  Expanded Cardlist({txt, align, blod = false}) => Expanded(
        child: Text(
          txt ?? "",
          textAlign: align ?? TextAlign.right,
          style: TextStyle(fontWeight: blod ? FontWeight.bold : null),
        ),
      );
}
// class OparetionPhpPage extends StatefulWidget {
//   const OparetionPhpPage({Key? key}) : super(key: key);

//   @override
//   State<OparetionPhpPage> createState() => _OparetionPhpPageState();
// }

// class _OparetionPhpPageState extends State<OparetionPhpPage> {
//   var _total = 0;
//   FetchUserList _userList = FetchUserList();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _userList.getuserList();
//     getDate();
//     setState(() {
//       //   CustomerController.sumTotalOP();
//       _total = CustomerController.sumTotal;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
//     String Function(Match) mathFunc = (Match match) => '${match[1]},';
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 4,
//         title: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 // Text(
//                 //   getDate.formattedDate,
//                 //   textAlign: TextAlign.right,
//                 // ),
//                 Container(height: 100, width: 100, child: DateFilter()),

//                 Center(
//                   child: Column(
//                     children: [
//                       Text(
//                         "العمليات",
//                         textAlign: TextAlign.left,
//                       ),
//                       Container(
//                         height: 3,
//                         width: 40,
//                         color: onlineGloble == "online"
//                             ? Colors.green
//                             : Colors.red,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         leading: IconButton(
//           onPressed: () {
//             //  showSearch(context: context, delegate: SearchUser(page: "op"));
//             showDialog(
//                 context: context,
//                 builder: (BuildContext cx) {
//                   return AlertDialog(
//                     title: Stack(
//                       children: [
//                         Positioned(
//                           right: 2,
//                           top: 2,
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.pop(cx);
//                             },
//                             child: Container(
//                               height: 30,
//                               width: 30,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: Color.fromARGB(255, 221, 44, 44),
//                               ),
//                               child: Center(
//                                 child: const Icon(
//                                   Icons.close,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Column(
//                           children: [
//                             Center(
//                               child: Text(
//                                 "بحث",
//                                 style: TextStyle(
//                                     fontSize: 25,
//                                     letterSpacing: 2,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         // const Align(
//                         //     alignment: Alignment.topRight,
//                         //     child: Text('التاريخ')),
//                         ElevatedButton(
//                           style: Constants.customButtonStyle,
//                           onPressed: () {
//                             Navigator.pop(cx);
//                             showSearch(
//                                 context: context,
//                                 delegate: SearchUser(page: "op"));
//                           },
//                           child: const Text('بحث بالاسم'),
//                         ),
//                         const SizedBox(height: 10),
//                         DateFilter(),
//                         const SizedBox(height: 10),
//                       ],
//                     ),
//                     actions: [
//                       Center(
//                         child: ElevatedButton(
//                           style: Constants.customButtonStyle,
//                           onPressed: () async {
//                             // _description.clear();
//                             // ScaffoldMessenger.of(context)
//                             //     .showSnackBar(const SnackBar(
//                             // backgroundColor: Constants.primaryColor,
//                             // duration: Duration(seconds: 1),
//                             // content: Text("Added todo successfully"),
//                             // ));
//                             setState(() {});
//                             Navigator.pop(cx);
//                           },
//                           child: const Text('بحث '),
//                         ),
//                       ),
//                     ],
//                   );
//                 });
//           },
//           icon: Icon(Icons.search_sharp),
//         ),
//       ),
//       body:
//           //  Directionality(
//           // textDirection: TextDirection.rtl,
//           // child:
//           Column(
//         children: [
//           Container(
//               margin: EdgeInsets.all(10),
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Theme.of(context).cardColor,
//                   border: Border.all(color: Colors.black)),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Center(child: Text("الدخول")),
//                       SizedBox(height: 10),
//                       Center(
//                         child: Text(
//                             _total.toString().replaceAllMapped(reg, mathFunc)),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Center(child: Text("السحب")),
//                       SizedBox(height: 10),
//                       Center(child: Text("0")),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       Center(child: Text("الباقي")),
//                       SizedBox(height: 10),
//                       Center(child: Text("${_total - 0}")),
//                     ],
//                   ),
//                 ],
//               )),
//           Expanded(
//             child: FutureBuilder(
//               future:
//                   CustomerController.getOPByDate(date: getDate.formattedDate),
//               builder: (context, AsyncSnapshot<List<OPModel>?> snapshot) {
//                 if (snapshot.hasData) {
//                   if (data.isNotEmpty) {
//                     return ListView.builder(
//                         itemCount: data.length,
//                         itemBuilder: (context, index) {
//                           var _da = data[index];
//                           return Column(
//                             children: [
//                               ListTile(
//                                 onTap: (() {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               OparetionDetails(data: _da)));
//                                 }),
//                                 leading: Text("${index + 1}"),
//                                 title: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(_da.custname!),
//                                     Text(_da.countsOp!
//                                         .toString()
//                                         .replaceAllMapped(reg, mathFunc)),
//                                   ],
//                                 ),
//                                 subtitle: Row(
//                                   children: [
//                                     Expanded(
//                                       child: Text(
//                                         "السواق: " + _da.person!,
//                                         textAlign: TextAlign.right,
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Center(
//                                         child: Text("الغرفه: " + _da.rooms!),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Text(
//                                         _da.dateCreated!,
//                                         textAlign: TextAlign.left,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 height: 2,
//                                 width: double.infinity,
//                                 margin: EdgeInsets.symmetric(horizontal: 10),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey,
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                                 padding: EdgeInsets.all(5),
//                               ),
//                             ],
//                           );
//                         });
//                   } else {
//                     return Text("لاتوجد بيانات في اليوم الحالي");
//                   }
//                 } else if (snapshot.hasError) {
//                   return Text(snapshot.error.toString());
//                 } else {
//                   return Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//       // ),
//     );
//   }
// }

// // class CustomerController {
// //   static Future<List<OPModel>?> getAll() async {
// //    String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/get_op.php";
// //     // String url ="http://192.168.43.192/flutter_php/04/get_op.php";

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

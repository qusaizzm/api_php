import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_php/Api/cubit/roon_cust_cubit/room_cust_cubit.dart';
import 'package:api_php/Api/model/Room_cust_model.dart';
import 'package:api_php/Api/model/op_model.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/cubit/opcubit/op_cubit.dart';
// import 'package:fz_md01/php/ui/Api_service.dart';
// import 'package:fz_md01/php/ui/search_op.dart';
// import 'package:fz_md01/php/ui/widget/date_now.dart';
// import 'package:fz_md01/sqlite/constants/constants.dart';

class CustByRoom extends StatefulWidget {
  final data;
  const CustByRoom({Key? key, this.data}) : super(key: key);

  @override
  State<CustByRoom> createState() => _CustByRoomState();
}

class _CustByRoomState extends State<CustByRoom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<RoomCustCubit>(context)..fetchRoomCust(widget.data.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text(
          "الغرفه: " + widget.data.toString(),
          textAlign: TextAlign.left,
        ),
      ),
      body: Center(
        child: BlocBuilder<RoomCustCubit, RoomCustState>(
          builder: (context, state) {
            if (state is RoomCustLoading) {
              return const CircularProgressIndicator();
            } else if (state is RoomCustError) {
              return Text(state.failure.message);
            } else if (state is RoomCustLoaded) {
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
  final List<RoomCustMl>? data;
  const OPCardWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _total = custsTotal.toString().replaceAllMapped(reg, mathFunc);
    return Column(
      children: [
        // Container(
        //     margin: EdgeInsets.all(10),
        //     padding: EdgeInsets.all(10),
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(10),
        //         color: Theme.of(context).cardColor,
        //         border: Border.all(color: Colors.black)),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Column(
        //           children: [
        //             Center(child: Text("الدخول")),
        //             SizedBox(height: 10),
        //             Center(
        //               child: Text(_total),
        //             ),
        //           ],
        //         ),
        //         Column(
        //           children: [
        //             Center(child: Text("السحب")),
        //             SizedBox(height: 10),
        //             Center(child: Text("0")),
        //           ],
        //         ),
        //         Column(
        //           children: [
        //             Center(child: Text("الباقي")),
        //             SizedBox(height: 10),
        //             Center(child: Text("${_total}")),
        //           ],
        //         ),
        //       ],
        //     )),

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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                textAlign: TextAlign.center,
                              ),
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
                                // Text(
                                //   "السواق: " + _da.person!,
                                // ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                "الغرفه: " + _da.room_no!.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
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
  }
}

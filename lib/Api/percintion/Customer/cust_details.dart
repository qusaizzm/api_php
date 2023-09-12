import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/cubit/opcubit/op_cubit.dart';
import 'package:api_php/Api/model/op_model.dart';
import 'package:api_php/Api/rep/api_rop.dart';
import 'package:api_php/Api/service/api_service.dart';
import 'package:intl/intl.dart';
// import 'package:api_php/Api/service/api_service.dart';

class CustomerBlucDetails extends StatefulWidget {
  final data;
  const CustomerBlucDetails({Key? key, this.data}) : super(key: key);

  @override
  State<CustomerBlucDetails> createState() => _CustomerBlucDetailsState();
}

class _CustomerBlucDetailsState extends State<CustomerBlucDetails> {
    var _total = custsTotalByName.toString().replaceAllMapped(reg, mathFunc);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<OpCubit>(context)..fetchOpbyName(widget.data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<OpCubit, OpState>(
        builder: (context, state) {
          if (state is OpLoading) {
            return const CircularProgressIndicator();
          } else if (state is OpError) {
            return Text(state.failure.message);
          } else if (state is OpLoadedBy) {
            final postList = state.optListBy;
            return postList.isEmpty
                ? const Text('No any posts')
                : Column(
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
                      Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              newMethod(
                                  txt: "العدد " + postList.length.toString(),
                                  fontSizeNO: 18.0),
                              newMethod(txt: "الماركه", fontSizeNO: 18.0),
                              newMethod(txt: "الغرفه", fontSizeNO: 18.0),
                              newMethod(txt: "السواق", fontSizeNO: 18.0),
                              newMethod(txt: "التاريخ", fontSizeNO: 18.0),
                            ],
                          )),
                      Expanded(
                        child: ListView.builder(
                            itemCount: postList.length,
                            itemBuilder: (context, index) {
                              final OPMll _da = postList[index];
                              // final DateTime now = DateTime.now();
                              // final DateFormat formatter = DateFormat('yyyy-MM-dd');
                              // final String formatted = formatter.format(now);
                              var dateString; //= //"25/04/2020";
                              var dateTime = DateFormat('yyyy/MM/dd')
                                  .parse(_da.dateCreated.toString());
                              dateString =
                                  DateFormat('dd/MMM ').format(dateTime);
                              // print(dateString);

                              // print(formatted);

                              return Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    // color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(4),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //       spreadRadius: 1,
                                    //       color: Colors.black,
                                    //       blurRadius: 1,
                                    //       offset: Offset(0, 0))
                                    // ],
                                  ),
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: _da.inOut == "in"
                                              ? Colors.greenAccent
                                              : Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding: EdgeInsets.all(5),
                                      ),
                                      newMethod(
                                          txt: _da.countsOp!, fontSizeNO: 14),
                                      newMethod(txt: _da.marks!),
                                      newMethod(txt: _da.rooms!.toString()),
                                      newMethod(
                                          txt: _da.person!,
                                          center: TextAlign.right),
                                      newMethod(txt: dateString),
                                      // _da.dateCreated!),
                                    ],
                                  ));
                            }),
                      ),
                    ],
                  );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Expanded newMethod({txt, double? fontSizeNO, TextAlign? center}) {
    return Expanded(
      child: Text(
        txt,
        textAlign: center ?? TextAlign.center,
        style: fontSizeNO == null
            ? null
            : TextStyle(
                fontSize: fontSizeNO,
                fontWeight: FontWeight.bold,
              ),
      ),
    );
  }
}

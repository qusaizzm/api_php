import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/cubit/custCubit/cust_cubit.dart';
import 'package:api_php/Api/model/cust_model.dart';

import 'cust_tab.dart';

class CustHomePage extends StatefulWidget {
  const CustHomePage({Key? key}) : super(key: key);

  @override
  State<CustHomePage> createState() => _CustHomePageState();
}

class _CustHomePageState extends State<CustHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CustCubit>(context)..fetchCustAll();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العملاء'),
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(context: context, delegate: SearchUser(page: "cust"));
            },
            icon: Icon(Icons.search_sharp),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CustCubit, CustState>(
          builder: (context, state) {
            if (state is CustLoading) {
              return const CircularProgressIndicator();
            } else if (state is CustError) {
              return Text(state.failure.message);
            } else if (state is CustLoaded) {
              final postList = state.postList;
              return postList.isEmpty
                  ? const Text('لا توجد بيانات')
                  : CustCardWidget(data: postList);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class CustCardWidget extends StatelessWidget {
  final List<CustMl>? data;
  const CustCardWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _total = custsTotal.toString().replaceAllMapped(reg, mathFunc);
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
        //               child: Text(_total.toString()),
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
        ListTile(
            title: Text(
              "مجموع التخزين",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // leading: Text("${index + 1}"),
            // trailing: Text(
            //     _da.total!.toString().replaceAllMapped(reg, mathFunc)),
            trailing: Text(
              _total.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Expanded(
          child: ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                var _da = data![index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CustomerTab(data: _da.custname)));
                  },
                  title: Text(_da.custname!),
                  leading: Text("${index + 1}"),
                  trailing: Text(
                      _da.total!.toString().replaceAllMapped(reg, mathFunc)),
                  subtitle: _da.den == "0" || _da.den == ""
                      ? Text("")
                      : Text(
                          "الدين: " + _da.den!.replaceAllMapped(reg, mathFunc),
                          style: TextStyle(color: Colors.red),
                        ),
                );
              }),
        )
      ],
    );
  }

  Expanded Cardlist({txt, align, blod = false}) => Expanded(
        child: Text(
          txt ?? "",
          textAlign: align ?? TextAlign.right,
          style: TextStyle(fontWeight: blod ? FontWeight.bold : null),
        ),
      );
}

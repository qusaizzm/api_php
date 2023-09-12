import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_php/Api/model/op_model.dart';
import 'package:api_php/Api/cubit/opcubit/op_cubit.dart';

class OpDetailsBluc extends StatelessWidget {
  final OPMll data;
  const OpDetailsBluc({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل العمليات'),
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

      //  FutureBuilder(
      //   future: CustomerController.getOP(),
      //   builder: (context, AsyncSnapshot<List<OPModel>?> snapshot) {
      //     if (snapshot.hasData) {
      //       if (snapshot.data!.isNotEmpty) {
      //         RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
      //         String Function(Match) mathFunc = (Match match) => '${match[1]},';
      //         return Column(
      //           children: [
      //             ListTile(
      //               title: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(widget.data.custname!),
      //                   Text(widget.data.countsOp!
      //                       .toString()
      //                       .replaceAllMapped(reg, mathFunc)),
      //                 ],
      //               ),
      //               subtitle: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text("السواق: " + widget.data.person!),
      //                   Text(widget.data.dateCreated!),
      //                 ],
      //               ),
      //             )
      //           ],
      //         );
      //       } else {
      //         return Text("NO Data Found");
      //       }
      //     } else if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}

class OPCardWidget extends StatelessWidget {
  final data;
  const OPCardWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final OPMll singlePost = data[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(singlePost.itemID.toString()),
          ),
          title: Text(singlePost.custname!),
          subtitle: Text(singlePost.countsOp!),
        );
      },
    );
  }
}
// class CustomerController {
//   static Future<List<OPModel>?> getAll() async {
//     String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/get_op.php";
//     List<OPModel> result = [];
//     try {
//       Dio dio = Dio();
//       DioCacheManager diocacheManger = DioCacheManager(CacheConfig());
//       Options myoptions =
//           buildCacheOptions(const Duration(days: 30), forceRefresh: true);
//       dio.interceptors.add(diocacheManger.interceptor);
//       var res = await dio.get(url, options: myoptions);
//       result = getList(res.data);
//     } catch (e) {
//       return null;
//     }
//     return result;
//   }

//   static getList(body) {
//     List<OPModel> cust = [];
//     List x = (body);
//     x.forEach((element) {
//       cust.add(OPModel.fromJson(element));
//     });
//     return cust;
//   }
// }

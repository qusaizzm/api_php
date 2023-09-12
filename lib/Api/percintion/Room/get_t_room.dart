import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/cubit/opcubit/op_cubit.dart';
import 'package:api_php/Api/cubit/roomCubit/room_cubit.dart';
import 'package:api_php/Api/model/room_model.dart';

import 'custBy_room.dart';

class TRoom extends StatefulWidget {
  const TRoom({Key? key, this.stock}) : super(key: key);
  final stock;
  @override
  State<TRoom> createState() => _TRoomState();
}

class _TRoomState extends State<TRoom> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // CustomerDetails(data: data),
    if (widget.stock == "t") {
      roomStock = "تبارك";
    } else {
      roomStock = "الاقيانوس";
    }
    BlocProvider.of<RoomCubit>(context)..fetchRoomAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<RoomCubit, RoomState>(
        builder: (context, state) {
          if (state is RoomLoading) {
            return const CircularProgressIndicator();
          } else if (state is RoomError) {
            return Text(state.failure.message);
          } else if (state is RoomLoaded) {
            final postList = state.postList;
            return postList.isEmpty
                ? const Text('لا توجد بيانات')
                : RoomCardWidget(data: postList);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class RoomCardWidget extends StatelessWidget {
  final List<RoomMl>? data;
  
  const RoomCardWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _total = stockTotal.toString().replaceAllMapped(reg, mathFunc);
    return Column(
      children: [
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
                                CustByRoom(data:  "${_da.name_no}")));
                  },
                  title: Text(_da.name_no.toString()),
                  // leading: Text("${index + 1}"),
                  trailing: Text(
                      _da.total!.toString().replaceAllMapped(reg, mathFunc)),
                  subtitle: Text(
                    _da.stock!,
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

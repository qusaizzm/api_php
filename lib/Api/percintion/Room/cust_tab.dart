import 'package:flutter/material.dart';

import 'get_t_room.dart';

class RoomHomePage extends StatelessWidget {
  final data;

  const RoomHomePage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Text("تبارك")),
              Tab(icon: Text("الاقيانوس")),
            ],
          ),
          title: const Text('الغرف'),
        ),
        body: TabBarView(
          children: [
            TRoom(stock: "t"),
            TRoom(
              stock: "q",
              
            ),
            //Icon(Icons.directions_car, size: 350),
            // Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}

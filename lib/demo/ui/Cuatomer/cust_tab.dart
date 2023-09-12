// import 'package:flutter/material.dart';

// import 'cust_details.dart';

// class CustomerTab extends StatelessWidget {
//   final data;

//   const CustomerTab({Key? key, this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             tabs: [
//               Tab(icon: Text("تفاصيل")),
//               Tab(icon: Text("الدين")),
//             ],
//           ),
//           title: Text('${data}'),
//         ),
//         body: TabBarView(
//           children: [
//             CustomerDetails(data: data),
//             Icon(Icons.directions_car, size: 350),
//           ],
//         ),
//       ),
//     );
//   }
// }

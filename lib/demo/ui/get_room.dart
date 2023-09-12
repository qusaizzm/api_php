// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fz_md01/12/view/widgets/icon_button_widget.dart';

// class RoomPhpPage extends StatefulWidget {
//   const RoomPhpPage({Key? key}) : super(key: key);

//   @override
//   State<RoomPhpPage> createState() => _RoomPhpPageState();
// }

// class _RoomPhpPageState extends State<RoomPhpPage> {
//   List userdata = [];
//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

//   Future<void> getdata() async {
//     String url = "https://d2fc-197-252-217-4.eu.ngrok.io/flutter/02/get_room.php";

//     //String url = "http://qusai.rf.gd/01/view.php"; //"sql300.epizy.com/01/get_room.php";
//     //    //"http://192.168.43.192/flutter_php/01/get_room.php"; gusai.rf.gd
//     try {
//       var rws = await http.get(Uri.parse(url));
//       if (rws.statusCode == 200) {
//         setState(() {
//           userdata = jsonDecode(rws.body);
//         });
//         //sql300.epizy.com
//       }
//       print("userdata $userdata");
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Edit Content'),
//           leading: IconButtonWidget(
//               iconData: Icons.arrow_back_sharp,
//               onTap: () => Navigator.of(context).pop(false)),
//         ),
//         body: Column(
//           children: [
//             InkWell(
//               onTap: (() {
//                 getdata();
//               }),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Center(child: Text("data")),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: userdata.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(userdata[index]["name"].toString()),
//                     );
//                   }),
//             ),
//           ],
//         ));
//   }
// }

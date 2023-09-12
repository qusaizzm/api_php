// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:fz_md01/12/view/widgets/icon_button_widget.dart';

// class StockPhpPage extends StatefulWidget {
//   const StockPhpPage({Key? key}) : super(key: key);

//   @override
//   State<StockPhpPage> createState() => _StockPhpPageState();
// }

// class _StockPhpPageState extends State<StockPhpPage> {
//   List userdata = [];
//   @override
//   void initState() {
//     super.initState();
//     getdata();
//   }

//   Future<void> getdata() async {
//     String url = "http://192.168.43.192/flutter_php/01/get_stock.php";
//     try {
//       var rws = await http.get(Uri.parse(url));
//       if (rws.statusCode == 200) {
//         setState(() {
//           userdata = jsonDecode(rws.body);
//         });
//       }
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
//         body: ListView.builder(
//             itemCount: userdata.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(userdata[index]["name"]),
//               );
//             }));
//   }
// }

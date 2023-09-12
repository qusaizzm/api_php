// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'Opration/get_op.dart';
// import 'Cuatomer/get_cust.dart';

// class HomePhpPage extends StatefulWidget {
//   const HomePhpPage({Key? key}) : super(key: key);

//   @override
//   State<HomePhpPage> createState() => _HomePhpPageState();
// }

// class _HomePhpPageState extends State<HomePhpPage> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     OparetionPhpPage(), // Text('Search Page',
//     CustomterPhpPage(), // Text('Search Page',
//     CustomterPhpPage(), // Text('Search Page',
//     //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     // RoomPhpPage(), // Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     Text('Profile Page',
//         style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: "العمليات", // Text('Home'),
//                 backgroundColor: Colors.green),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: "العملاء", // Text('Search'),
//                 backgroundColor: Colors.yellow),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: "المصروفات", // Text('Profile'),
//               backgroundColor: Colors.blue,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: "الغرف", // Text('Profile'),
//               backgroundColor: Colors.blue,
//             ),
//           ],
//           type: BottomNavigationBarType.shifting,
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.black,
//           iconSize: 25,
//           onTap: _onItemTapped,
//           elevation: 5),
//     );
//   }
// }

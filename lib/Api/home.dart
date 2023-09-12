import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:api_php/Api/cubit/opcubit/op_cubit.dart';
import 'package:api_php/Api/cubit/roomCubit/room_cubit.dart';
import 'package:api_php/Api/percintion/Customer/get_cust.dart';
import 'package:api_php/Api/rep/api_rop.dart';
import 'package:api_php/Api/service/api_service.dart';
// import 'package:fz_md01/sqlite/constants/constants.dart';

import 'constants/api_constants.dart';
import 'constants/constants.dart';
import 'cubit/custCubit/cust_cubit.dart';
import 'cubit/roon_cust_cubit/room_cust_cubit.dart';
import 'percintion/Op/get_op.dart';
import 'percintion/Room/cust_tab.dart';
import 'percintion/Room/get_t_room.dart';

class ApiPhpMyApp extends StatelessWidget {
  const ApiPhpMyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OpCubit>(
          create: (context) => OpCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchOp(),
        ),
        BlocProvider<CustCubit>(
          create: (context) => CustCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchCustAll(),
        ),
        BlocProvider<RoomCubit>(
          create: (context) => RoomCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchRoomAll(),
        ),
        BlocProvider<RoomCustCubit>(
          create: (context) => RoomCustCubit()..fetchRoomCust(roomName),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar',
              ''), // Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale('ar', ''), // Arabic
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                color: Constants.primaryColor, centerTitle: true)),

        home: const HomePhpPage(),
      ),
    );
  }
}

class HomePhpPage extends StatefulWidget {
  const HomePhpPage({Key? key}) : super(key: key);

  @override
  State<HomePhpPage> createState() => _HomePhpPageState();
}

class _HomePhpPageState extends State<HomePhpPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    OPHomePage(), // Text('Search Page',
    CustHomePage(),
    RoomHomePage(),
    // Text('Search Page'),
    // Text('Search Page'),
    //     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    // RoomPhpPage(), // Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "العمليات", // Text('Home'),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "العملاء", // Text('Search'),
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
              icon: Icon(Icons.room_preferences_sharp),
              label: "الغرف", // Text('Profile'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "المصروفات", // Text('Profile'),
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 25,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}

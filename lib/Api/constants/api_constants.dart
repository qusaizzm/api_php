// https://jsonplaceholder.typicode.com/posts
import 'package:intl/intl.dart';

const String baseUrlApi =
    'https://awesome-voice-58784.pktriot.net/flutter_php/04/';
// String urlList =

const String opLINK = 'get_op.php';
const String custLINK = "get_custo.php";
const String roomLINK = "get_room.php";
const String cust_roomLINK = "get_custby_room.php";
const onlineConn = true;
int feeSumTotal = 0;
int custsTotal = 0;
int stockTotal = 0;
int custsTotalByName = 0;
String roomStock = "تبارك";
String roomName = "";

var formaDateNow = DateFormat('yyyy/MM/dd').format(DateTime.now());

RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
String Function(Match) mathFunc = (Match match) => '${match[1]},';

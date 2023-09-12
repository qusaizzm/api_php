import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_php/Api/constants/api_constants.dart';
import 'package:api_php/Api/cubit/opcubit/op_cubit.dart';
import 'package:api_php/Api/service/api_service.dart'; 
import 'package:intl/intl.dart';
 
import 'timeDatePicker/widget/button_widget.dart';

class DateFilter extends StatefulWidget {
  @override
  _DateFilterState createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return formaDateNow;
    } else {
      print(getDate.formattedDate + "pppppp");
      formaDateNow = DateFormat('yyyy/MM/dd').format(date!);
      print(getDate.formattedDate + ";;;;;;;;;;;");
      return DateFormat('yyyy/MM/dd').format(date!);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Date',
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() {
      final ApiService apiService;

      date = newDate;
      formaDateNow = DateFormat('yyyy/MM/dd').format(date!);
      BlocProvider.of<OpCubit>(context)..fetchOpbyData();
      //  context.read<OpCubit>()
    });
  }
}

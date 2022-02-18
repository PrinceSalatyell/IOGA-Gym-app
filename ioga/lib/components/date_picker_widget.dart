import 'package:flutter/material.dart';
import 'package:ioga/constants.dart';
import 'schedule_button_header.dart';

class DatePickerWidget extends StatefulWidget {
  static late String dateToShow;
  static late String weekday;

  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return 'Escolher a Data';
    } else {
      return '${date!.day}-${date!.month}-${date!.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
        icon: Icon(
          Icons.date_range_sharp,
          color: kAccentColor,
        ),
        title: 'Data',
        text: getText(),
        onClicked: () => pickDate(context));
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      locale: const Locale("pt", "PT"),
      initialDate: date ?? initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) return;

    setState(() {
      date = newDate;
      String month = date!.month.toString() == '1'
          ? 'Jan'
          : date!.month.toString() == '2'
              ? 'Fev'
              : date!.month.toString() == '3'
                  ? 'Mar'
                  : date!.month.toString() == '4'
                      ? 'Abr'
                      : date!.month.toString() == '5'
                          ? 'Mai'
                          : date!.month.toString() == '6'
                              ? 'Jun'
                              : date!.month.toString() == '7'
                                  ? 'Jul'
                                  : date!.month.toString() == '8'
                                      ? 'Ago'
                                      : date!.month.toString() == '9'
                                          ? 'Set'
                                          : date!.month.toString() == '10'
                                              ? 'Out'
                                              : date!.month.toString() == '11'
                                                  ? 'Nov'
                                                  : 'Dez';
      DatePickerWidget.dateToShow = '${date!.day}/$month';
      DatePickerWidget.weekday = '${date!.weekday}';
    });
  }
}

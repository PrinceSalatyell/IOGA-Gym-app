import 'package:flutter/material.dart';
import 'package:ioga/constants.dart';
import 'schedule_button_header.dart';

class TimePickerWidget extends StatefulWidget {

  static late String timeToShow;

  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {

  TimeOfDay? time;

  String getText() {
    if (time == null) {
      return 'Escolher a Hora';
    } else {
      final hours = time!.hour.toString().length == 1 ? time!.hour.toString().padLeft(2, '0') : time!.hour.toString();
      final minutes = time!.minute.toString().length == 1 ? time!.minute.toString().padLeft(2, '0') : time!.minute.toString();

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(icon: Icon(Icons.access_time_rounded, color: kAccentColor,), title: 'Hora', text: getText(), onClicked: () => pickTime(context));
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      context: context,
      confirmText: 'Confirmar',
      cancelText: 'Cancelar',
      initialTime: time ?? initialTime,
      hourLabelText: 'Horas',
      minuteLabelText: 'Minutos',
      errorInvalidText: 'Informação Inválida',
      //initialEntryMode: TimePickerEntryMode.input

    );

    if (newTime == null) return;

    setState(() {
      time = newTime;
      final hours = time!.hour.toString().length == 1 ? time!.hour.toString().padLeft(2, '0') : time!.hour.toString();
      final minutes = time!.minute.toString().length == 1 ? time!.minute.toString().padLeft(2, '0') : time!.minute.toString();

      TimePickerWidget.timeToShow = '$hours:$minutes';
    });

  }
}

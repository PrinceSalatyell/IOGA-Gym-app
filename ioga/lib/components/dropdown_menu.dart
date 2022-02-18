import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants.dart';

class ScheduleDropDown extends StatefulWidget {

  var item;
  final Icon icon;
  final String text;
  static late String durationToShow;
  static late String focusToShow;

  ScheduleDropDown({Key? key, required this.item, required this.icon, required this.text}) : super(key: key);

  @override
  _ScheduleDropDownState createState() => _ScheduleDropDownState();
}

class _ScheduleDropDownState extends State<ScheduleDropDown> {

  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow[300],
      ),
      child: DropdownButton(
        dropdownColor: kAccentSecondaryColor,
        alignment: Alignment.center,
        style: kTitleTextStyle.copyWith(color: Colors.black87),
        hint: Center(
          child: FittedBox(
            child: Row(
              children: [
                widget.icon,
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.text}',
                  style: kTitleTextStyle.copyWith(
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        items: widget.item.map<DropdownMenuItem<String>>(buildMenuItem).toList(),
        value: value,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down, color: Colors.black87,),
        iconSize: 30,
        onChanged: (value) {
          setState(() {
            this.value = value as String?;
            if (value!.contains('Horas')) {
              ScheduleDropDown.durationToShow = value;
            } else{
              ScheduleDropDown.focusToShow = value;
            }
          });
        },
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Center(
        child: Text(
          item,
          style: kTitleTextStyle.copyWith(
              color: Colors.black87),
        ),
      ),
    );
  }
}

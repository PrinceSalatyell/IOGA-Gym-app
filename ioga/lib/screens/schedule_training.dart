import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/components/date_picker_widget.dart';
import 'package:ioga/components/dropdown_menu.dart';
import 'package:ioga/components/time_picker_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants.dart';
import 'package:ioga/utils/training_day.dart';

class ScheduleTraining extends StatefulWidget {
  const ScheduleTraining({Key? key}) : super(key: key);

  @override
  _ScheduleTrainingState createState() => _ScheduleTrainingState();
}

class _ScheduleTrainingState extends State<ScheduleTraining> {
  var trainingFocus = [
    'Pernas',
    'Peito',
    'Bíceps/Tríceps',
    'Abdomen',
    'cardio',
    'Geral',
    'Hipertrofia Muscular',
    'Fortalecimento Muscular',
    'Resistência Muscular',
    'Potência Muscular',
    'Outro...'
  ];

  var duration = ['1 Horas', '2 Horas', '3 Horas', '4 Horas', '5 Horas'];

  String groupValue = 'Não';

  late String pTrainer;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kAccentColor,
              title: Text(
                'Agendar Treinos',
                style: kTitleTextStyle,
              ),
              centerTitle: true,
              elevation: 0.1,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),

                DatePickerWidget(),

                SizedBox(height: 20.0),

                TimePickerWidget(),

                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Duração',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ScheduleDropDown(
                      icon: Icon(
                        Icons.timer,
                        color: kAccentColor,
                      ),
                      text: 'Establecer Duração (Horas)',
                      item: duration,
                    )
                  ],
                ),

                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Foco',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    ScheduleDropDown(
                      icon: Icon(
                        LineAwesomeIcons.hanging_weight,
                        color: kAccentColor,
                      ),
                      text: 'Foco da Sessão',
                      item: trainingFocus,
                    )
                  ],
                ),

                SizedBox(height: 20.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Personal Trainer',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: Colors.yellow[700],
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text("Sim",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.black)),
                              trailing: Radio(
                                  activeColor: Colors.white,
                                  value: "Sim",
                                  groupValue: groupValue,
                                  onChanged: (e) => valueChanged(e)),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text("Não",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Colors.black)),
                              trailing: Radio(
                                  activeColor: Colors.white,
                                  value: "Não",
                                  groupValue: groupValue,
                                  onChanged: (e) => valueChanged(e)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40.0),

                Container(
                  height: kSpacingUnit.w * 5.5,
                  margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 10)
                      .copyWith(bottom: kSpacingUnit.w * 2),
                  padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4),
                  decoration: BoxDecoration(
                      color: Colors.yellow[900],
                      borderRadius: BorderRadius.circular(kSpacingUnit.w * 3)),
                  child: InkWell(
                      onTap: () {
                        createAlertDialog(context);
                      },
                      child: Center(
                          child: Text(
                        'Agendar',
                        style: kTitleTextStyle.copyWith(color: Colors.black87),
                      ))),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "Não") {
        groupValue = e;
        pTrainer = e;
      } else if (e == "Sim") {
        groupValue = e;
        pTrainer = e;
      }
    });
  }

  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: ThemeProvider.of(context)!.brightness == Brightness.dark
          ? Colors.grey[900] : Colors.grey[300],
        title: const Text('Confirmar detalhes da sessão:'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            SizedBox(height: 10.0,),
            Text('Data :       ${DatePickerWidget.weekday}, ${DatePickerWidget.dateToShow}', style: kCaptionTextStyle,),
            SizedBox(height: 10.0,),
            Text('Hora :       ${TimePickerWidget.timeToShow}', style: kCaptionTextStyle,),
            SizedBox(height: 10.0,),
            Text('Duração :       ${ScheduleDropDown.durationToShow}', style: kCaptionTextStyle,),
            SizedBox(height: 10.0,),
            Text('Foco :       ${ScheduleDropDown.focusToShow}', style: kCaptionTextStyle,),
            SizedBox(height: 10.0,),
            Text('Treino acompanhado :       $groupValue', style: kCaptionTextStyle,),
          ],
        ),
        actions: [
          MaterialButton(
            color: Colors.redAccent,
            elevation: 5.0,
            child: const Text('Cancelar', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(width: 85,),
          MaterialButton(
            color: Colors.amber[700],
            elevation: 5.0,
            child: const Text('Confirmar', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }
}

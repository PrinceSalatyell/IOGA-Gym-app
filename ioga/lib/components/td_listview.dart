import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:ioga/utils/training_day.dart';

import '../constants.dart';

class TDListView extends StatefulWidget {
  const TDListView({Key? key}) : super(key: key);

  @override
  _TDListViewState createState() => _TDListViewState();
}

class _TDListViewState extends State<TDListView> {
  var trainingDetails = [
    TrainingDay(
        dayOfWeek: 'Seg',
        date: '20-Nov',
        time: '18:30',
        pTrainer: false,
        focus: 'Peito',
        duration: 2),
    TrainingDay(
        dayOfWeek: 'Qua',
        date: '22-Nov',
        time: '19:30',
        pTrainer: false,
        focus: 'Bíceps/Tríceps',
        duration: 1),
    TrainingDay(
        dayOfWeek: 'Sex',
        date: '24-Nov',
        time: '16:00',
        pTrainer: true,
        focus: 'Fortalecimento Muscular',
        duration: 3,
        ptName: 'Fernado Sousa'),
    TrainingDay(
        dayOfWeek: 'Dom',
        date: '26-Nov',
        time: '12:30',
        pTrainer: true,
        focus: 'Potência Muscular',
        duration: 3,
        ptName: 'Fernando Sousa'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: trainingDetails.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 20.0),
              ListTile(
                tileColor:
                    ThemeProvider.of(context)!.brightness == Brightness.dark
                        ? Colors.grey[800]
                        : Colors.grey[300],
                leading: Text(
                  trainingDetails[index].dayOfWeek,
                  style: kTitleTextStyle,
                ),
                title: Text(
                  '${trainingDetails[index].date}, ${trainingDetails[index].time} -> ${trainingDetails[index].duration}H',
                  style: kTitleTextStyle,
                ),
                subtitle: trainingDetails[index].pTrainer
                    ? Column(
                        children: [
                          Text(
                            '${trainingDetails[index].focus}',
                            style: kCaptionTextStyle.copyWith(color: kAccentColor),
                          ),
                          Text(
                            'com: ${trainingDetails[index].ptName}',
                            style: kCaptionTextStyle,
                          )
                        ],
                      )
                    : Center(
                        child: Text('${trainingDetails[index].focus}',
                            style: kCaptionTextStyle.copyWith(color: kAccentColor))),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, color: Colors.red,),
                ),
              ),
            ],
          );
        });
  }
}

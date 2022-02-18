import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/components/td_listview.dart';
import 'package:ioga/constants.dart';

class TrainingPlan extends StatefulWidget {
  const TrainingPlan({Key? key}) : super(key: key);

  @override
  _TrainingPlanState createState() => _TrainingPlanState();
}

class _TrainingPlanState extends State<TrainingPlan> {
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
              centerTitle: true,
              backgroundColor: kAccentColor,
              title: Text('Plano de Treinos', style: kTitleTextStyle,),
            ),
            body: TDListView(),
          );
        },
      ),
    );
  }
}
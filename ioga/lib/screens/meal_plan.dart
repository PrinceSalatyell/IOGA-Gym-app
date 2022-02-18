import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class MealPlan extends StatelessWidget {

  MealPlan({Key? key}) : super(key: key);

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
              elevation: 0.1,
              title: Text('plano de alimentação', style: kTitleTextStyle,),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/userProfile');
                  },
                  icon: Icon(Icons.home),
                )
              ],
              centerTitle: true,
            ),
            body: ListView(
              children: [
                SizedBox(height: 10.0,),

                DayCard(day: 'Segunda - Feira', color: Colors.yellow[100],),

                SizedBox(height: 10.0,),

                DayCard(day: 'Terça - Feira', color: Colors.yellow[200],),

                SizedBox(height: 10.0,),

                DayCard(day: 'Quarta - Feira', color: Colors.yellow[300],),

                SizedBox(height: 10.0,),

                DayCard(day: 'Quinta - Feira', color: Colors.yellow[400],),

                SizedBox(height: 10.0,),

                DayCard(day: 'Sexta - Feira', color: Colors.yellow[500],),

                SizedBox(height: 10.0,),

                DayCard(day: 'Sábado', color: Colors.yellow[800],),

                SizedBox(height: 10.0,),

                DayCard(day: 'Domingo', color: Colors.yellow[900],),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DayCard extends StatelessWidget {

  final String day;
  final Color? color;

  const DayCard({Key? key, required this.day, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/dailyPlan', arguments:
          {'name' : day},
        );
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(kSpacingUnit.w * 2)
        ),
        child: Center(child: Text('$day', style: kTitleTextStyle.copyWith(color: Colors.black),)),
      ),
    );
  }
}

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/constants.dart';

class DailyPlan extends StatelessWidget {
  const DailyPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Map day = (ModalRoute.of(context)!.settings.arguments) as Map;
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
              title: Text(day['name'], style: kTitleTextStyle,),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: 10.0,),
                Card(
                  color: Colors.yellow[100],
                  child: Container(
                    height: 80.0,
                    width: 400.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
                          child: Text('Foco:', style: kTitleTextStyle.copyWith(color: Colors.black54),),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(indent: 30, endIndent: 30,),
                Card(
                  color: Colors.yellow[100],
                  child: Container(
                    height: 100.0,
                    width: 400.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: Text('Pequeno-Almoço:', style: kTitleTextStyle.copyWith(color: Colors.black54),),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(indent: 30, endIndent: 30,),
                Card(
                  color: Colors.yellow[100],
                  child: Container(
                    height: 190.0,
                    width: 400.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: Text('Almoço:', style: kTitleTextStyle.copyWith(color: Colors.black54),),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(indent: 30, endIndent: 30,),
                Card(
                  color: Colors.yellow[100],
                  child: Container(
                    height: 190.0,
                    width: 400.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: Text('Jantar:', style: kTitleTextStyle.copyWith(color: Colors.black54),),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

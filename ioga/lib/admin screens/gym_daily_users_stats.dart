import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/components/line_chart_widget.dart';

class DailyUsersStats extends StatelessWidget {
  const DailyUsersStats({Key? key}) : super(key: key);

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
            appBar: AppBar(title: const Text('Clientes por hora'), centerTitle: true, backgroundColor: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(0xff8b6d2c) : Color(
                0xffffc349),),
            body: Padding(
              padding: const EdgeInsets.all(8),
              child: PageView(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(0xff8b6d2c) : Color(
                        0xffffc349),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, right: 24.0),
                      child: LineChartWidget(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
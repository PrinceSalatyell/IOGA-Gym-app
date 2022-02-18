import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class GymHomePage extends StatefulWidget {
  const GymHomePage({Key? key}) : super(key: key);

  @override
  State<GymHomePage> createState() => _GymHomePageState();
}

class _GymHomePageState extends State<GymHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return AnimatedCrossFade(
          duration: Duration(milliseconds: 200),
          crossFadeState:
          ThemeProvider.of(context)!.brightness == Brightness.dark
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context)!.changeTheme(theme: kLightTheme),
            child: Icon(
              LineAwesomeIcons.sun,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
          secondChild: GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context)!.changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              color: Colors.black,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: Text(
                'Página Principal',
                style: kTitleTextStyle.copyWith(color: kAccentColor),
              ),
              leading: themeSwitcher,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuItem(
                      color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(0xff8b6d2c) : Color(
                          0xffffc349),
                      title: 'Estatística Diária',
                      icon: LineAwesomeIcons.calendar_with_day_focus,
                      route: '/gymDailyUsersStats',
                    ),
                    MenuItem(
                      color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(0xff0e506d) : Color(
                          0xff4ec4fd),
                      title: 'Estatística Semanal',
                      icon: LineAwesomeIcons.calendar_with_week_focus,
                      route: '/gymWeeklyUsersStats'
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuItem(
                        color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(0xff6d0e0e) : Color(
                            0xfffd3e3e),
                        title: 'Estatísticas Gerais',
                        icon: LineAwesomeIcons.pie_chart,
                        route: '/gymGeneralStats'
                    ),
                    MenuItem(
                        color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(
                            0xff456d0e) : Color(
                            0xffb1ff46),
                        title: 'Lista de Clientes',
                        icon: LineAwesomeIcons.users,
                        route: '/gymClientList'
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                MenuItem(
                    color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(
                        0xFF808080) : Color(0xFFD0D0D0),
                    title: 'Registrar Cliente',
                    icon: LineAwesomeIcons.user_plus,
                    route: '/gymWeeklyUsersStats'
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final String route;

  const MenuItem({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          color: color,
          child: GridTile(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(icon, size: 100,),
            ),
            header: Padding(
              padding: const EdgeInsets.only(left:8.0, top: 8),
              child: Text(
                '$title',
                style: kTitleTextStyle.copyWith(fontSize: 15,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


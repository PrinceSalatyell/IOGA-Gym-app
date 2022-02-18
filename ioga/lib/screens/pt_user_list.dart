import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/components/user_pt_listview.dart';
import 'package:ioga/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PTUserList extends StatefulWidget {
  const PTUserList({Key? key}) : super(key: key);

  @override
  _PTMenuState createState() => _PTMenuState();
}

class _PTMenuState extends State<PTUserList> {

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
              elevation: 0.1,
              backgroundColor: kAccentColor,
              title: Text('Meus Trainadores'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/userProfile');
                  },
                  icon: Icon(LineAwesomeIcons.home),
                ),
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Expanded(child: UserPTListView()),
              ],
            ),
          );
        },
      ),
    );
  }
}
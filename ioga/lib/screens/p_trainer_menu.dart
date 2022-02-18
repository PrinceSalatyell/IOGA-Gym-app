import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/components/pt_gridview.dart';
import 'package:ioga/components/pt_listview.dart';
import 'package:ioga/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PTMenu extends StatefulWidget {
  const PTMenu({Key? key}) : super(key: key);

  @override
  _PTMenuState createState() => _PTMenuState();
}

class _PTMenuState extends State<PTMenu> {
  bool isSearching = false;
  List<bool> isSelected = [true, false];

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
              title: !isSearching
                  ? Text('Personal Trainers')
                  : TextField(
                cursorColor: ThemeProvider.of(context)!.brightness == Brightness.dark
                    ? Colors.black : Colors.white,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person_search, color: Colors.white),
                          hintText: 'Procurar...',
                      ),
                    ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                  icon: isSearching ? Icon(Icons.cancel_outlined) : Icon(Icons.search),
                ),
                SizedBox(
                  width: 2.0,
                ),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        height: 20.0,
                        child: ToggleButtons(
                          renderBorder: false,
                          selectedColor: kAccentColor,
                          fillColor: kAccentColor!.withOpacity(0.3),
                          isSelected: isSelected,
                          children: [
                            Icon(
                              Icons.format_list_bulleted,
                              color: kAccentSecondaryColor,
                              size: 20.0,
                            ),
                            Icon(
                              Icons.grid_view,
                              color: kAccentSecondaryColor,
                              size: 20.0,
                            )
                          ],
                          onPressed: (int newIndex) {
                            setState(() {
                              for (int index = 0;
                                  index < isSelected.length;
                                  index++) {
                                if (index == newIndex) {
                                  isSelected[index] = true;
                                } else {
                                  isSelected[index] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(child: isSelected[1] ? PTGridView() : PTListView()),
              ],
            ),
          );
        },
      ),
    );
  }
}

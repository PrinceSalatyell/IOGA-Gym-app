import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

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
          return SafeArea(
            child: Column(
              children: [
                Container(
                  height: 300.0,
                  width: double.infinity,
                  child: Stack(fit: StackFit.expand , children: [
                    Image.asset(
                      'assets/images/gym_banner.jpg',
                      fit: BoxFit.cover,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Container(child: Icon(Icons.cancel, size: 35,), alignment: Alignment.topLeft,),
                    )
                  ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  color: kAccentColor,
                  child: Row(
                    children: [
                      Text(
                        'Gym Name',
                        style: kTitleTextStyle.copyWith(
                            fontSize: 40.0,
                            color: ThemeProvider.of(context)!.brightness ==
                                    Brightness.dark
                                ? Colors.black
                                : Colors.white),
                      ),
                      SizedBox(width: 6.0),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.email,
                        size: 25,
                        color: kAccentColor,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'GymEmail@email.com',
                      style: kCaptionTextStyle.copyWith(
                          color: kAccentSecondaryColor,
                          fontSize: 20.0,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        LineAwesomeIcons.mobile_phone,
                        size: 25,
                        color: kAccentColor,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '+244 123 456 789',
                      style: kCaptionTextStyle.copyWith(
                          color: kAccentSecondaryColor,
                          fontSize: 20.0,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        LineAwesomeIcons.phone,
                        size: 25,
                        color: kAccentColor,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      '222 123 456',
                      style: kCaptionTextStyle.copyWith(
                          color: kAccentSecondaryColor,
                          fontSize: 20.0,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        LineAwesomeIcons.wikipedia_w,
                        size: 25,
                        color: kAccentColor,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'www.gymwebsite.com',
                      style: kCaptionTextStyle.copyWith(
                          color: kAccentSecondaryColor,
                          fontSize: 20.0,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

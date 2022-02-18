import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:ioga/utils/user_preferences.dart';
import 'package:ioga/utils/user.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);

    var profileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/editUserProfile');
              },
              child: Stack(children: [
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage(user.photo),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle),
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: kDarkPrimaryColor,
                      size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                    ),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: kSpacingUnit.w * 2,
          ),
          Text(
            user.name,
            style: kTitleTextStyle,
          ),
          SizedBox(
            height: kSpacingUnit.w * 0.5,
          ),
          Text(
            user.email,
            style: kCaptionTextStyle,
          ),
          SizedBox(
            height: kSpacingUnit.w * 2,
          ),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: Theme.of(context).accentColor),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/trainingPlan');
              },
              child: Center(
                child: Text(
                  'Plano de Treinos',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );

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
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ),
          ),
        );
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: kSpacingUnit.w * 3,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        profileInfo,
        themeSwitcher,
        SizedBox(
          width: kSpacingUnit.w * 3,
        ),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: kSpacingUnit.w * 5,
                ),
                header,
                Expanded(
                  child: ListView(
                    children: [
                      ProfileListItem(
                        icon: LineAwesomeIcons.calendar_with_day_focus,
                        text: 'Agendamentos',
                        route: '/scheduleTraining',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.hanging_weight,
                        text: 'Meus Treinadores',
                        route: '/ptUserList',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.clipboard_list,
                        text: 'Plano de Alimentação',
                        route: '/mealPlan',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'Ajuda e Suporte',
                        route: '/helpAndSupport',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'sair',
                        hasNavigation: false,
                        route: '/login',
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;
  final String route;

  const ProfileListItem({
    Key? key,
    required this.icon,
    this.text,
    this.hasNavigation = true,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2.5)
          .copyWith(bottom: kSpacingUnit.w * 2),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4),
      decoration: BoxDecoration(
          color: ThemeProvider.of(context)!.brightness == Brightness.light
              ? Theme.of(context)
                  .backgroundColor
                  .withBlue(180)
                  .withGreen(180)
                  .withRed(180)
              : Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(kSpacingUnit.w * 3)),
      child: TextButton(
        onPressed: () {
          if (!hasNavigation) {
            Navigator.pushReplacementNamed(context, route);
          } else {
            Navigator.of(context).pushNamed(route);
          }
        },
        child: Row(
          children: [
            Icon(
              icon,
              size: kSpacingUnit.w * 2.5,
              color: !hasNavigation
                  ? Colors.red
                  : ThemeProvider.of(context)!.brightness == Brightness.light
                      ? kAccentSecondaryColor
                      : kAccentColor,
            ),
            SizedBox(width: kSpacingUnit.w * 1.5),
            Text(
              text,
              style: kTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: kSpacingUnit.w * 1.4,
                  color:
                      ThemeProvider.of(context)!.brightness == Brightness.light
                          ? Colors.black
                          : Colors.white),
            ),
            Spacer(),
            if (hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: kSpacingUnit.w * 2.5,
                color: ThemeProvider.of(context)!.brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}

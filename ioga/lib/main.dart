import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:ioga/screens/daily_plan.dart';
import 'package:ioga/screens/edit_user_profile.dart';
import 'package:ioga/screens/help_and_support.dart';
import 'package:ioga/screens/login.dart';
import 'package:ioga/screens/meal_plan.dart';
import 'package:ioga/screens/p_trainer_menu.dart';
import 'package:ioga/screens/p_trainer_profile.dart';
import 'package:ioga/screens/pt_user_list.dart';
import 'package:ioga/screens/schedule_training.dart';
import 'package:ioga/screens/signup.dart';
import 'package:ioga/screens/training_plan.dart';
import 'package:ioga/screens/user_profile.dart';
import 'admin screens/gym_client_list.dart';
import 'admin screens/gym_general_stats.dart';
import 'admin screens/gym_daily_users_stats.dart';
import 'admin screens/gym_home_page.dart';
import 'admin screens/gym_weekly_users_stats.dart';
import 'constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(ThemeProvider(
    initTheme: kDarkTheme,
    child: Builder(builder: (context) {
      return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('pt'),
        ],
        theme: ThemeProvider.of(context),
        debugShowCheckedModeBanner: false,
        initialRoute: '/userProfile',
        routes: {
          '/login': (context) => const Login(),
          '/signup': (context) => const SignUp(),
          '/ptProfile': (context) => const PTProfile(),
          '/userProfile': (context) => const UserProfile(),
          '/editUserProfile': (context) => const EditUserProfile(),
          '/ptMenu' : (context) => const PTMenu(),
          '/helpAndSupport' : (context) => const HelpAndSupport(),
          '/mealPlan' : (context) => MealPlan(),
          '/dailyPlan' : (context) => const DailyPlan(),
          '/trainingPlan' : (context) => const TrainingPlan(),
          '/scheduleTraining' : (context) => const ScheduleTraining(),
          '/ptUserList' : (context) => const PTUserList(),
          '/gymDailyUsersStats' : (context) => const DailyUsersStats(),
          '/gymWeeklyUsersStats' : (context) => const WeeklyUsersStats(),
          '/gymHomePage' : (context) => const GymHomePage(),
          '/gymGeneralStats' : (context) => const GeneralStats(),
          '/gymClientList' : (context) => const ClientList(),
        },
      );
    },)
  ));
}

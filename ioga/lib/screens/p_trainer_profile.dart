import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:ioga/components/pt_listview.dart';

class PTProfile extends StatefulWidget {
  const PTProfile({Key? key}) : super(key: key);

  @override
  _PTProfileState createState() => _PTProfileState();
}

class _PTProfileState extends State<PTProfile> {

  DateTime? dateTime;
  TimeOfDay? time;
  DateTime? date;
  bool isAdded = false;
  late String name;
  late String timeToShow;

  @override
  Widget build(BuildContext context) {

    final Map info = (ModalRoute.of(context)!.settings.arguments) as Map;
    name = info['name'];
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);

    Icon addButton = isAdded ? Icon(Icons.remove) : Icon(Icons.add);
    String buttonText = isAdded ? 'rem' : 'add';
    Color? buttonColor = isAdded ? Colors.red : ThemeProvider.of(context)!.brightness == Brightness.dark ? kAccentColor : kAccentSecondaryColor;

    return ThemeSwitchingArea(child: Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bio',
            style: kTitleTextStyle,
          ),
          elevation: 0.1,
          backgroundColor: Theme.of(context).accentColor,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage(info['photo']),
                  )),
            ),

            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 2.0),
                child: Text(
                  'loremipsum@email.com',
                  style: kCaptionTextStyle
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0.0),
                child: Text(
                    '+244 123456789',
                    style: kCaptionTextStyle
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                    child: Text(
                      info['name'],
                      style: kTitleTextStyle.copyWith(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        primary: info['isAdded'] ? Colors.red : ThemeProvider.of(context)!.brightness == Brightness.dark ? kAccentColor : kAccentSecondaryColor,
                        onPrimary: Colors.black,
                        elevation: 5.0,
                        minimumSize: Size(0.5, 0.5)
                      ),
                        onPressed: () {
                        setState(() {
                          info['isAdded'] = info['isAdded'] == true ? false : true;
                        });
                        },
                        icon: info['isAdded'] == true ? Icon(Icons.remove) : Icon(Icons.add),
                        label: info['isAdded'] == true ? Text('rem') : Text('add')),
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.white54,
              indent: 25.0,
              endIndent: 25.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 4.0),
              color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Colors.black45 : Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14.0, color: ThemeProvider.of(context)!.brightness == Brightness.dark ? Colors.white : Colors.black),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PTInfo(description: 'Informação:', info: 'Info',),
                      PTInfo(description: 'Informação:', info: 'Info',),
                      PTInfo(description: 'Informação:', info: 'Info',),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PTInfo(description: 'Informação:', info: 'Info',),
                      PTInfo(description: 'Informação:', info: 'Info',),
                      PTInfo(description: 'Informação:', info: 'Info',),
                    ],
                  )
                ],
              ),
            ),



          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pickDateTime(context);
          },
          child: Icon(LineAwesomeIcons.calendar_plus, size: 35.0,),
          tooltip: 'agendar',
        ),
      );
    }));
  }

  Future pickDateTime(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      locale: const Locale("pt", "PT"),
      initialDate: date ?? initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) return;

    setState(() {
      date = newDate;
    });

    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      context: context,
      confirmText: 'Confirmar',
      cancelText: 'Cancelar',
      initialTime: time ?? initialTime,
      hourLabelText: 'Horas',
      minuteLabelText: 'Minutos',
      errorInvalidText: 'Informação Inválida',
      //initialEntryMode: TimePickerEntryMode.input

    );

    if (newTime == null) return;

    setState(() {
      time = newTime;
      final hours = time!.hour.toString().length == 1 ? time!.hour.toString().padLeft(2, '0') : time!.hour.toString();
      final minutes = time!.minute.toString().length == 1 ? time!.minute.toString().padLeft(2, '0') : time!.minute.toString();
      timeToShow = '$hours:$minutes';
    });

    setState(() {
      dateTime = DateTime(
        date!.weekday,
        date!.day,
        date!.month,
        date!.year,
        time!.hour,
        time!.minute
      );
    });

    createAlertDialog(context);
  }

  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: ThemeProvider.of(context)!.brightness == Brightness.dark
            ? Colors.grey[900] : Colors.grey[300],
        title: const Text('Confirmar'),
        content: Text('Marcar Sessão com $name no dia ${dateTime!.day}/${dateTime!.month} às $timeToShow?'),
        actions: [
          MaterialButton(
            color: Colors.redAccent,
            elevation: 5.0,
            child: const Text('Não', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(width: 85,),
          MaterialButton(
            color: Colors.amber[700],
            elevation: 5.0,
            child: const Text('Sim', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }
}

class PTInfo extends StatelessWidget {
  final String description;
  final String info;

  const PTInfo({Key? key, required this.description, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Container(
                alignment: Alignment.topCenter,
                child: Text(
                    description,
                    style: kCaptionTextStyle.copyWith(fontSize: kSpacingUnit.w * 1.1)
                )),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                  info,
                  style: ThemeProvider.of(context)!.brightness == Brightness.dark ? kTitleTextStyle.copyWith(color: kAccentColor, fontWeight: FontWeight.bold) : kTitleTextStyle.copyWith(color: kAccentSecondaryColor, fontWeight: FontWeight.bold)
              ),
            ),
          ),
        ));
  }
}


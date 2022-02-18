import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:ioga/constants.dart';
import 'package:ioga/utils/personal_trainer.dart';

class PTListView extends StatefulWidget {
  const PTListView({Key? key}) : super(key: key);

  @override
  _PTListViewState createState() => _PTListViewState();
}

class _PTListViewState extends State<PTListView> {

  var ptList = [
    PersonalTrainer(
        name: 'Luís Macedo',
        specialty: 'Cardio',
        photo: 'assets/images/personal_trainers/pt9.jpg',
        age: 38,
        email: 'luismacedo@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'João Paulo',
        specialty: 'Geral',
        photo: 'assets/images/personal_trainers/pt4.jpg',
        age: 34,
        email: 'joaopaulo@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Yana Katembe',
        specialty: 'Perda de Peso',
        photo: 'assets/images/personal_trainers/pt3.jpg',
        age: 28,
        email: 'yanakatembe@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Laura Mateus',
        specialty: 'Cardio',
        photo: 'assets/images/personal_trainers/pt6.jpg',
        age: 32,
        email: 'lauramateus@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Damião Almeida',
        specialty: 'Força & Cond.',
        photo: 'assets/images/personal_trainers/pt5.jpeg',
        age: 33,
        email: 'damiaoalmeida@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Misael Katito',
        specialty: 'Bodybuilding',
        photo: 'assets/images/personal_trainers/pt8.jpg',
        age: 35,
        email: 'misaelkatito@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Helena Simeão',
        specialty: 'Gestor de Fitness',
        photo: 'assets/images/personal_trainers/pt7.jpg',
        age: 27,
        email: 'helenasimeao@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Manuel Azevedo',
        specialty: 'Geral',
        photo: 'assets/images/personal_trainers/pt1.jpg',
        age: 33,
        email: 'manuelazevedo@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Xando José',
        specialty: 'Bodybuilding',
        photo: 'assets/images/personal_trainers/pt2.png',
        age: 29,
        email: 'xandojose@email.com',
        phoneNumber: '+244 123 456 789'
    ),
    PersonalTrainer(
        name: 'Luísa Augusto',
        specialty: 'Bodybuilding',
        photo: 'assets/images/personal_trainers/pt10.png',
        age: 30,
        email: 'luisaaugusto@email.com',
        phoneNumber: '+244 123 456 789'
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: ptList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              tileColor: ThemeProvider.of(context)!.brightness == Brightness.dark
                  ? Color(0xFF373737) : Colors.grey[200],
              onTap: () {
                Navigator.pushNamed(context, '/ptProfile', arguments: {
                  'name' : ptList[index].name,
                  'photo' : ptList[index].photo,
                  'isAdded' : ptList[index].isAdded,
                });
              },

              // ========= LEADING SECTION ========
              leading: Image.asset(
                ptList[index].photo,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.fill,
              ),

              // ======== TITLE SECTION ========
              title: Text(ptList[index].name, style: kTitleTextStyle,),

              // =========== SUBTITLE SECTION =============
              subtitle: Text(ptList[index].specialty, style: kCaptionTextStyle.copyWith(color: Colors.green[700]),),

              // =========== TRAILING SECTION =============
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    ptList[index].isAdded = ptList[index].isAdded ? false : true;
                  });
                },
                icon: ptList[index].isAdded == true ? Icon(Icons.remove) : Icon(Icons.add),
                color: ptList[index].isAdded == true ? Colors.red : ThemeProvider.of(context)!.brightness == Brightness.dark
                   ? kAccentColor : kAccentSecondaryColor,
              ),
            ),
          );
    });
  }
}

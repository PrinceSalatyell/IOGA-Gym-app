import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:ioga/constants.dart';
import 'package:ioga/utils/personal_trainer.dart';

class PTGridView extends StatefulWidget {
  const PTGridView({Key? key}) : super(key: key);

  @override
  _PTGridViewState createState() => _PTGridViewState();
}

class _PTGridViewState extends State<PTGridView> {
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
    return GridView.builder(
      itemCount: ptList.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/ptProfile', arguments: {
                'name' : ptList[index].name,
                'photo' : ptList[index].photo,
                'isAdded' : ptList[index].isAdded,
              });
            },
            child: GridTile(
              child: Container(
                  child: Image.asset(
                ptList[index].photo,
                    fit: BoxFit.fill,
              )),
              header: Container(
                  height: 28.0,
                  color: ThemeProvider.of(context)!.brightness == Brightness.dark
                      ?  Color(0xFF000000).withOpacity(0.3) : Colors.white.withOpacity(0.3),
                  child: Center(
                      child: Text(ptList[index].name, style: kTitleTextStyle))),
              footer: Container(
                color: ThemeProvider.of(context)!.brightness == Brightness.dark
                    ?  Color(0xFF000000).withOpacity(0.7) : Colors.white.withOpacity(0.7),
                height: 28.0,
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        ptList[index].specialty,
                        style:
                            kCaptionTextStyle.copyWith(color: Colors.green[700]),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            ptList[index].isAdded =
                                ptList[index].isAdded ? false : true;
                          });
                        },
                        icon: ptList[index].isAdded == true
                            ? Icon(Icons.remove)
                            : Icon(Icons.add),
                        color: ptList[index].isAdded == true
                            ? Colors.red
                            : ThemeProvider.of(context)!.brightness ==
                                    Brightness.dark
                                ? kAccentColor
                                : kAccentSecondaryColor,
                      ),
                      alignment: Alignment.centerRight,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}

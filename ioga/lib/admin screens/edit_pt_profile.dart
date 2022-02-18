import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/utils/user.dart';
import 'package:ioga/utils/user_preferences.dart';

import '../constants.dart';

class EditPTProfile extends StatefulWidget {
  const EditPTProfile({Key? key}) : super(key: key);

  @override
  _EditPTProfileState createState() => _EditPTProfileState();
}

class _EditPTProfileState extends State<EditPTProfile> {
  User user = UserPreferences.myUser;
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    Color passColor = hidePass ? Colors.grey : Colors.blue;

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
              leading: BackButton(),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: [
                Center(
                  child: Container(
                    height: kSpacingUnit.w * 10,
                    width: kSpacingUnit.w * 10,
                    margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
                    child: Stack(children: [
                      CircleAvatar(
                        radius: kSpacingUnit.w * 5,
                        backgroundImage: AssetImage(user.photo),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: kSpacingUnit.w * 2.5,
                            width: kSpacingUnit.w * 2.5,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.add_a_photo,
                              color: kDarkPrimaryColor,
                              size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFieldWidget(
                  label: 'Primeiro e Último Nome',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFieldWidget(
                  label: 'Telefone',
                  text: user.phoneNumber,
                  onChanged: (phoneNumber) {},
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFieldWidget(
                  isPassword: true,
                  label: 'Nova Palavra-Passe',
                  text: user.password,
                  onChanged: (password) {},
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.grey[900],
                              title:
                              Center(child: const Text('Voltar')),
                              content: Text('Voltar para a página anterior sem guardar as alterações?'),
                              actions: [
                                Container(
                                  padding: EdgeInsets.only(right: 110),
                                  child: MaterialButton(
                                    color: Colors.red[700],
                                    elevation: 5.0,
                                    child: const Text(
                                      'Não',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                MaterialButton(
                                  color: Colors.amber[700],
                                  elevation: 5.0,
                                  child: const Text(
                                    'Sim',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(context, '/userProfile');
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'CANCELAR',
                        style: kCaptionTextStyle,
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.grey[900],
                              title:
                              const Text('Confirmar Palavra-Passe Actual:'),
                              content: Stack(children: [
                                TextFormField(
                                  obscureText: hidePass,
                                  maxLines: 1,
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  top: 0,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: passColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = !hidePass;
                                        passColor = hidePass
                                            ? Colors.grey
                                            : Colors.blue;
                                      });
                                    },
                                  ),
                                ),
                              ]),
                              actions: [
                                MaterialButton(
                                  color: Colors.amber[700],
                                  elevation: 5.0,
                                  child: const Text(
                                    'confirmar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'GUARDAR',
                        style: kCaptionTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: kAccentColor,
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  final bool isPassword;
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget(
      {Key? key,
        this.isPassword = false,
        this.maxLines = 1,
        required this.label,
        required this.text,
        required this.onChanged})
      : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;
  bool hidePass = true;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color passColor = hidePass ? Colors.grey : Colors.blue;

    return !widget.isPassword
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: kTitleTextStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        TextField(
          maxLines: widget.maxLines,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12))),
        )
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: kTitleTextStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Stack(children: [
          TextField(
            obscureText: hidePass,
            maxLines: widget.maxLines,
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: passColor,
              ),
              onPressed: () {
                setState(() {
                  hidePass = !hidePass;
                  passColor = hidePass ? Colors.grey : Colors.blue;
                });
              },
            ),
          ),
        ]),
      ],
    );
  }
}

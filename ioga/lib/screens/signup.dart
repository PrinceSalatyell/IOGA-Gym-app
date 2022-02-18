import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _ageTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
  TextEditingController();
  late String gender;
  String groupValue = "male";
  bool hidePass = true;
  bool hideCPass = true;

  @override
  Widget build(BuildContext context) {

    Color passColor = hidePass ? Colors.grey : Colors.blue;
    Color cPassColor = hideCPass ? Colors.grey : Colors.blue;

    return Scaffold(
      body: Stack(
        children: <Widget>[

          // Background image
          Image.asset(
            'assets/images/women.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Logo image
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 55.0, 8.0, 8.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/logo.png',
              width: 100.0,
              height: 100.0,),
            ),
          ),

          // Shade
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),

          // Form field
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                  child: Form(
                    key: _formKey,
                    child: ListView(children: [

                      // == NAME FIELD ==
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Nome Completo',
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none),
                              controller: _nameTextController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Por favor, preencha o campo.";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      // == AGE FIELD ==
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: 'Idade',
                                  icon: Icon(Icons.date_range),
                                  border: InputBorder.none),
                              controller: _ageTextController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Por favor, preencha o campo.";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),

                      // == EMAIL FIELD ==
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  hintText: 'Email',
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none),
                              controller: _emailTextController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = RegExp(pattern.toString());
                                  if (!regex.hasMatch(value)) {
                                    return 'Email inválido!';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),

                      // == GENDER FIELD ==
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Container(
                          color: Colors.white.withOpacity(0.4),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text("Homem",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white)),
                                  trailing: Radio(
                                      value: "male",
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text("Mulher",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white)),
                                  trailing: Radio(
                                      value: "female",
                                      groupValue: groupValue,
                                      onChanged: (e) => valueChanged(e)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // == PASSWORD FIELD ==
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                    hintText: 'Palavra-passe',
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none),
                                controller: _passwordTextController,
                                obscureText: hidePass,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Por favor, preencha o campo.";
                                  } else if (value.length < 6) {
                                    return "Palavra passe demasiado curta(min. 6 car.)";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
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
                          ),
                        ),
                      ),

                      // == CONFIRM PASSWORD FIELD ==
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.4),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                    hintText: 'Confirmar palavra-passe',
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none),
                                controller: _confirmPasswordTextController,
                                obscureText: hideCPass,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Por favor, preencha o campo.";
                                  } else if (_passwordTextController.text !=
                                      value) {
                                    return "As palavras-passe inseridas são diferentes.";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: cPassColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    hideCPass = !hideCPass;
                                    cPassColor = hideCPass ? Colors.grey : Colors.blue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      // == SIGNUP BUTTON ==
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.amber[700],
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {
                                if(!_formKey.currentState!.validate()) {
                                  return;
                                }
                                _formKey.currentState!.save();
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: const Text(
                                'Criar Conta',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            )),
                      ),

                      // == RETURN TO LOGIN ==
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Já tenho uma conta",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ]),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }
}

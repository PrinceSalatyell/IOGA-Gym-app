import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _remailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool hidePass = true;

  createAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('Seu email:'),
        content: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _remailTextController,
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
        actions: [
          MaterialButton(
            color: Colors.amber[700],
            elevation: 5.0,
            child: const Text('confirmar', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    Color passColor = hidePass ? Colors.grey : Colors.blue;

    return Scaffold(
      body: Stack(
        children: <Widget>[

          // Background Image
          Image.asset(
            'assets/images/men.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Logo Image
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 100.0, 8.0, 8.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/logo.png',
              width: 150.0,
              height: 150.0,),
            ),
          ),

          //Shade
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),

          // Form field
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Center(
                  child: Form(
                    key: _formKey,
                    child: ListView(children: [

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
                              decoration: const InputDecoration(
                                  hintText: 'Email',
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none
                              ),
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
                                decoration: const InputDecoration(
                                    hintText: 'Palavra-passe',
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none
                                ),
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
                              trailing: IconButton(icon: Icon(Icons.remove_red_eye, color: passColor,),
                                onPressed: (){
                                  setState((){
                                    hidePass = !hidePass;
                                    passColor = hidePass ? Colors.grey : Colors.blue;
                                  });
                                },),
                            ),
                          ),
                        ),
                      ),

                      // == LOGIN BUTTON ==
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
                                'Entrar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            )),
                      ),

                      const SizedBox(height: 10.0,),

                      // == FORGOT PASSWORD INKWELL ==
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            createAlertDialog(context);
                          },
                          child: const Text(
                            'Recuperar palavra-passe',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 12.0, decoration: TextDecoration.underline),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10.0,),

                      // GO TO SIGNUP PAGE ==
                      Padding(
                        padding: const EdgeInsets.only(top: 170.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text('Criar conta'),
                        )
                      ),
                    ]),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

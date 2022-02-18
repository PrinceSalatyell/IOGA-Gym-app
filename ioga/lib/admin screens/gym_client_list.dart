import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioga/components/client_listview.dart';

class ClientList extends StatefulWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {

  bool isSearching = false;

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
              centerTitle: true,
              title: !isSearching
                  ? Text('Lista de Clientes')
                  : TextField(
                cursorColor: ThemeProvider.of(context)!.brightness == Brightness.dark
                    ? Colors.black : Colors.white,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  icon: Icon(Icons.person_search, color: Colors.white),
                  hintText: 'Procurar...',
                ),
              ),
              backgroundColor: ThemeProvider.of(context)!.brightness == Brightness.dark ? Color(
                  0xff456d0e) : Color(0xffb1ff46),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                  icon: isSearching ? Icon(Icons.cancel_outlined) : Icon(Icons.search),
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Expanded(child: ClientListView(),),
              ],
            ),
          );
        },
      ),
    );
  }
}

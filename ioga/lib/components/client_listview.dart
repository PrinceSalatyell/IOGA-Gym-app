import 'package:flutter/material.dart';
import 'package:ioga/utils/client.dart';

import '../constants.dart';

class ClientListView extends StatefulWidget {
  const ClientListView({Key? key}) : super(key: key);

  @override
  _ClientListViewState createState() => _ClientListViewState();
}

class _ClientListViewState extends State<ClientListView> {
  var clientList = [
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
    Client(
        name: 'John Doe',
        phoneNumber: '923 123 456',
        email: 'JohnDoe@email.com',
        gender: 'M',
        photo: 'assets/images/profileuser.jpg',
        yearOfRegistry: 2019,
        address: 'Rua Dr Agostinho das Neves, Maianga'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clientList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(clientList[index].name, style: kTitleTextStyle,),
          ),
        );
      },
    );
  }
}

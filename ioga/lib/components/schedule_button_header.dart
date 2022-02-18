import 'package:flutter/material.dart';
import 'package:ioga/constants.dart';

class ButtonHeaderWidget extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;
  final Icon icon;

  const ButtonHeaderWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.onClicked,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
    title: title,
    child: ButtonWidget(
      icon: icon,
      text: text,
      onClicked: onClicked,
    ),
  );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final Icon icon;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size.fromHeight(50),
      primary: Colors.yellow[300],
    ),
    child: FittedBox(
      child: Row(
        children: [
          icon,
          SizedBox(width: 10,),
          Text(
            text,
            style: kTitleTextStyle.copyWith(color: Colors.black87),
          ),
        ],
      ),
    ),
    onPressed: onClicked,
  );
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const HeaderWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.amber,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 8),
      child,
    ],
  );
}
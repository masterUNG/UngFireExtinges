import 'package:flutter/material.dart';

class ShowOfficer extends StatefulWidget {
  const ShowOfficer({ Key? key }) : super(key: key);

  @override
  _ShowOfficerState createState() => _ShowOfficerState();
}

class _ShowOfficerState extends State<ShowOfficer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('This is show Officer'),
    );
  }
}
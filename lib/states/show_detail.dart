import 'package:flutter/material.dart';

class ShowDetail extends StatefulWidget {
  const ShowDetail({ Key? key }) : super(key: key);

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show Detail'),),
    );
  }
}
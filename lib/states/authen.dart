import 'package:flutter/material.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/widgets/show_image.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: const Text('Authen'),
      ),body: ShowImage(path: 'images/authen.png'),
    );
  }
}

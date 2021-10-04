import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungfireextin/utility/my_constant.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<void> readData() async {
    await Firebase.initializeApp().then((value) {
      print('Firebase Initial Success');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(MyConstant.appName),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => fieldSearch(constraints),
        ));
  }

  Row fieldSearch(BoxConstraints constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: constraints.maxWidth * 0.8,
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class OfficerService extends StatefulWidget {
  const OfficerService({Key? key}) : super(key: key);

  @override
  _OfficerServiceState createState() => _OfficerServiceState();
}

class _OfficerServiceState extends State<OfficerService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Officer'),
      ),
    );
  }
}

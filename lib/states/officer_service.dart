import 'package:flutter/material.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/widgets/build_signout.dart';
import 'package:ungfireextin/widgets/show_title.dart';

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
        backgroundColor: MyConstant.primary,
        title: const Text('Officer'),
      ),
      drawer: const Drawer(
        child: BuildSignOut(),
      ),
    );
  }

  
}

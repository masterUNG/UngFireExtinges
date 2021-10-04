import 'package:flutter/material.dart';
import 'package:ungfireextin/states/admin_service.dart';
import 'package:ungfireextin/states/authen.dart';
import 'package:ungfireextin/states/main_home.dart';
import 'package:ungfireextin/states/officer_service.dart';
import 'package:ungfireextin/states/show_detail.dart';
import 'package:ungfireextin/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  '/mainHome': (BuildContext context) => const MainHome(),
  '/showDetail': (BuildContext context) => const ShowDetail(),
  '/authen': (BuildContext context) => const Authen(),
  '/adminService': (BuildContext context) => const AdminService(),
  '/officerService': (BuildContext context) => const OfficerService(),
};

String? firstState;

main() {
  firstState = MyConstant.routMainHome;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: map,
      initialRoute: firstState,
      title: MyConstant.appName,
    );
  }
}

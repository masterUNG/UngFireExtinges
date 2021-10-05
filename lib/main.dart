import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungfireextin/models/user_model.dart';
import 'package:ungfireextin/states/add_extin.dart';
import 'package:ungfireextin/states/admin_service.dart';
import 'package:ungfireextin/states/authen.dart';
import 'package:ungfireextin/states/main_home.dart';
import 'package:ungfireextin/states/officer_service.dart';
import 'package:ungfireextin/utility/my_constant.dart';

Map<String, WidgetBuilder> map = {
  '/mainHome': (BuildContext context) => const MainHome(),
  '/authen': (BuildContext context) => const Authen(),
  '/adminService': (BuildContext context) => const AdminService(),
  '/officerService': (BuildContext context) => const OfficerService(),
  '/addExtin': (BuildContext context) => const AddExtin(),
};

String? firstState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      // print('## event ==>> $event');
      if (event == null) {
        firstState = MyConstant.routMainHome;
        runApp(const MyApp());
      } else {
        String uid = event.uid;
        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .get()
            .then((value) {
          UserModel model = UserModel.fromMap(value.data()!);
          switch (model.type) {
            case 'admin':
              firstState = MyConstant.routAdminService;
              runApp(const MyApp());
              break;
            case 'officer':
              firstState = MyConstant.routOfficerService;
              runApp(const MyApp());
              break;
            default:
          }
        });
      }
    });
  });
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

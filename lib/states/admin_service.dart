import 'package:flutter/material.dart';
import 'package:ungfireextin/bodys/show_extinguisher.dart';
import 'package:ungfireextin/bodys/show_officer.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/widgets/build_signout.dart';
import 'package:ungfireextin/widgets/show_title.dart';

class AdminService extends StatefulWidget {
  const AdminService({Key? key}) : super(key: key);

  @override
  _AdminServiceState createState() => _AdminServiceState();
}

class _AdminServiceState extends State<AdminService> {
  List<Widget> widgets = [];
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widgets.add(const ShowExtinguisher());
    widgets.add(const ShowOfficer());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: const Text('Admin'),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            const BuildSignOut(),
            Column(
              children: [
                buildHead(),
                menuShowExtinguicher(),
                menuShowOfficer(),
              ],
            ),
          ],
        ),
      ),
      body: widgets[index],
    );
  }

  ListTile menuShowExtinguicher() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          index = 0;
        });
      },
      leading: Icon(
        Icons.filter_1,
        color: MyConstant.primary,
      ),
      title: ShowTitle(
        title: 'Show Extinguicher',
        textStyle: MyConstant().h2Style(),
      ),
    );
  }

  ListTile menuShowOfficer() {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        setState(() {
          index = 1;
        });
      },
      leading: Icon(
        Icons.filter_2,
        color: MyConstant.primary,
      ),
      title: ShowTitle(
        title: 'Show Officer',
        textStyle: MyConstant().h2Style(),
      ),
    );
  }

  UserAccountsDrawerHeader buildHead() =>
      UserAccountsDrawerHeader(accountName: null, accountEmail: null);
}

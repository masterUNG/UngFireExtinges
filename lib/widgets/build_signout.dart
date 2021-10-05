import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/widgets/show_title.dart';

class BuildSignOut extends StatelessWidget {
  const BuildSignOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.pushNamedAndRemoveUntil(
                        context, MyConstant.routMainHome, (route) => false),
                  );
            });
          },
          leading: Icon(
            Icons.exit_to_app,
            color: MyConstant.primary,
            size: 36,
          ),
          title: ShowTitle(
            title: 'Sign Out',
            textStyle: MyConstant().h2Style(),
          ),
        ),
      ],
    );
  }
}

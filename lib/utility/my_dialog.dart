import 'package:flutter/material.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/widgets/show_image.dart';
import 'package:ungfireextin/widgets/show_title.dart';

class MyDialog {
  Future<void> progressDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        child: const Center(child: CircularProgressIndicator()),
        onWillPop: () async {
          return false;
        },
      ),
    );
  }

  Future<void> normalDialog(BuildContext context, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const ShowImage(path: 'images/authen.png'),
          title: ShowTitle(
            title: 'Have Error ?',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTitle(title: message),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

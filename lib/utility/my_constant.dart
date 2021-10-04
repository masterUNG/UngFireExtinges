import 'package:flutter/material.dart';

class MyConstant {
  // field
  static String routMainHome = '/mainHome';
  static String routShowDetail = '/showDetail';
  static String routAuthen = '/authen';
  static String routAdminService = '/adminService';
  static String routOfficerService = '/officerService';

  static String appName = 'Ung Fire Extinguisher';

  static Color primary = Colors.purple;
  static Color dark = Colors.purple;
  static Color light = Colors.purple.shade200;

  // method
  TextStyle h1Style() => const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      );

      TextStyle h2Style() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      );

      TextStyle h3Style() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.purple,
      );
}

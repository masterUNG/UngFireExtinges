import 'package:flutter/material.dart';
import 'package:ungfireextin/models/extinguisher_model.dart';

class AssignOfficer extends StatefulWidget {
  final ExtinguisherModel extinguisherModel;
  const AssignOfficer({Key? key, required this.extinguisherModel})
      : super(key: key);

  @override
  _AssignOfficerState createState() => _AssignOfficerState();
}

class _AssignOfficerState extends State<AssignOfficer> {
  ExtinguisherModel? extinguisherModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    extinguisherModel = widget.extinguisherModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Officer'),
      ),body: Text(extinguisherModel!.name),
    );
  }
}

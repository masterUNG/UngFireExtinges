import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungfireextin/models/extinguisher_model.dart';
import 'package:ungfireextin/states/assign_officer.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/widgets/show_network_image.dart';
import 'package:ungfireextin/widgets/show_progress.dart';
import 'package:ungfireextin/widgets/show_title.dart';

class ShowExtinguisher extends StatefulWidget {
  const ShowExtinguisher({Key? key}) : super(key: key);

  @override
  _ShowExtinguisherState createState() => _ShowExtinguisherState();
}

class _ShowExtinguisherState extends State<ShowExtinguisher> {
  bool load = true;
  List<ExtinguisherModel> extinModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    if (extinModels.isNotEmpty) {
      extinModels.clear();
    }

    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('extinguisher')
          .get()
          .then((value) {
        for (var item in value.docs) {
          ExtinguisherModel model = ExtinguisherModel.fromMap(item.data());
          setState(() {
            load = false;
            extinModels.add(model);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: load ? const ShowProgress() : buildListExtin(),
      floatingActionButton: buttonAddExtin(context),
    );
  }

  ElevatedButton buttonAddExtin(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(primary: MyConstant.primary),
        onPressed: () => Navigator.pushNamed(context, MyConstant.routAddExtin)
            .then((value) => readAllData()),
        icon: Icon(Icons.add),
        label: Text('Add Extinguisher'));
  }

  ListView buildListExtin() {
    return ListView.builder(
      itemCount: extinModels.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AssignOfficer(extinguisherModel: extinModels[index]),
          ),
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 130,
                  child: ShowNetWorkImage(urlImage: extinModels[index].image),
                ),
                ShowTitle(
                  title: extinModels[index].name,
                  textStyle: MyConstant().h1Style(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

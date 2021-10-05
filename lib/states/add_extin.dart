import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ungfireextin/models/extinguisher_model.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/utility/my_dialog.dart';
import 'package:ungfireextin/widgets/show_image.dart';

class AddExtin extends StatefulWidget {
  const AddExtin({Key? key}) : super(key: key);

  @override
  _AddExtinState createState() => _AddExtinState();
}

class _AddExtinState extends State<AddExtin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? file;

  Container fieldName(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      width: constraints.maxWidth * 0.6,
      height: 60,
      child: TextFormField(
        controller: nameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Name in Blank';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Name :',
          prefixIcon: Icon(Icons.perm_identity),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
        ),
      ),
    );
  }

  Container fieldLocation(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      width: constraints.maxWidth * 0.6,
      height: 60,
      child: TextFormField(
        controller: locationController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Fill Location in Blank';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Location :',
          prefixIcon: Icon(Icons.location_city),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyConstant.primary,
        title: const Text('Add Extinguiser'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    fieldName(constraints),
                    fieldLocation(constraints),
                    buildImage(constraints),
                    buttonAddExtin(constraints),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> processTakePhoto(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .pickImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Container buildImage(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () => processTakePhoto(ImageSource.camera),
              icon: const Icon(
                Icons.add_a_photo,
                size: 48,
              )),
          Container(
            width: constraints.maxWidth * 0.6,
            child: file == null
                ? const ShowImage(path: 'images/question.png')
                : Image.file(file!),
          ),
          IconButton(
              onPressed: () => processTakePhoto(ImageSource.gallery),
              icon: const Icon(
                Icons.add_photo_alternate,
                size: 48,
              )),
        ],
      ),
    );
  }

  Future<void> processUploadImage() async {
    MyDialog().progressDialog(context);

    int i = Random().nextInt(1000000);
    String nameImage = 'extin$i.jpeg';
    print('## nameImage ==> $nameImage');

    await Firebase.initializeApp().then((value) async {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference reference = storage.ref().child('extinguisher/$nameImage');
      UploadTask uploadTask = reference.putFile(file!);
      await uploadTask.whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          String image = value.toString();
          print('## image ==> $image');
          // Navigator.pop(context);
          processInsertValueToFirebase(image);
        });
      });
    });
  }

  Future<void> processInsertValueToFirebase(String image) async {
    ExtinguisherModel extinguisherModel = ExtinguisherModel(
        image: image,
        location: locationController.text,
        name: nameController.text);

    await FirebaseFirestore.instance
        .collection('extinguisher')
        .doc()
        .set(extinguisherModel.toMap())
        .then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  Container buttonAddExtin(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: constraints.maxWidth * 0.6,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(primary: MyConstant.primary),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (file == null) {
              MyDialog().normalDialog(
                  context, 'Please Choose Image by tap Camera or Gallery');
            } else {
              processUploadImage();
            }
          }
        },
        icon: const Icon(Icons.cloud_upload),
        label: const Text('Add Extinguiser'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ungfireextin/models/extinguisher_model.dart';
import 'package:ungfireextin/utility/my_constant.dart';
import 'package:ungfireextin/widgets/show_network_image.dart';
import 'package:ungfireextin/widgets/show_title.dart';

class ShowDetail extends StatefulWidget {
  final ExtinguisherModel extinguisherModel;
  const ShowDetail({Key? key, required this.extinguisherModel})
      : super(key: key);

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
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
        title: const Text('Show Detail'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Column(
            children: [
              ShowTitle(
                title: extinguisherModel!.name,
                textStyle: MyConstant().h1Style(),
              ),
              Container(width: constraints.maxWidth*0.6,
                child: ShowNetWorkImage(urlImage: extinguisherModel!.image),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

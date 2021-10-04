import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ungfireextin/widgets/show_progress.dart';

class ShowNetWorkImage extends StatelessWidget {
  final String urlImage;
  const ShowNetWorkImage({Key? key, required this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      placeholder: (context, url) => const ShowProgress(),
      errorWidget: (context, url, error) => Image.asset('images/question.png'),
    );
  }
}

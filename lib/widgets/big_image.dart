//This is one of the two elements on third page

import 'package:flutter/material.dart';


class BigImage extends StatelessWidget {
  final String url;
  const BigImage({
    Key? key,
    required this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
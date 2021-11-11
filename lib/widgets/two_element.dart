import 'package:flutter/material.dart';
class TwoElement extends StatelessWidget {

  const TwoElement({
    Key? key,
    required this.class1,
    required this.class2
  }) : super(key: key);

  final dynamic class1;
  final dynamic class2; 

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: Center(
              child: class1,
            ),
          ),
          Expanded(
            child: Center(
              child: class2,
            ),
          )
        ],
      );
  }
}
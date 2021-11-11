//Drawn on page two
import 'package:flutter/material.dart';
import 'package:palashassignment/model/photos.dart';
import 'package:palashassignment/widgets/comment.dart';
import 'package:provider/provider.dart';

class ImageOnList extends StatefulWidget {
  const ImageOnList({Key? key}) : super(key: key);

  @override
  State<ImageOnList> createState() => _ImageOnListState();
}

class _ImageOnListState extends State<ImageOnList> {
  String msg = 'Hello';
  @override
  Widget build(BuildContext context) {
    var photo = context.read<Photos>(); //context.read<UserData>();
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detailedImageView',
            arguments: {'photo': photo},
          ).then((value) => {setState(() {})});
        },
        child: Column(
          children: [
            Image.network(
              photo.surl,
              loadingBuilder: (context, child, progress) {
                return progress == null ? child : const CircularProgressIndicator();
              },
              width: 120,
              height: 120,
              fit:  BoxFit.fill,
            ),
            Comments(),
          ],
        ));
  }
}

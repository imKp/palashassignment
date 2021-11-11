//This widget handels the functionality to add comment button.
//The button is on page 3.

import 'package:flutter/material.dart';
import 'package:palashassignment/services/db_service.dart';

class CommentButton extends StatelessWidget {
  

  const CommentButton({
    Key? key,
    required this.searchTextController,
    required this.id,
  }) : super(key: key);

  final TextEditingController searchTextController;
  final int id;
  Future _saveComment(Map<String, Object> data) async {
    await DBHelper.insert('comments', data);
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 200),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(24.0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (searchTextController.text.isNotEmpty) {                  
                  _saveComment({
                    'comment': searchTextController.text,
                    'id': id
                  }).then((value) => {
                        Navigator.pop(context),
                    });
                } else {
                  
                }
              },
              child: const Text('COMMENT'),
            ),
          ],
        ),
      ),
    );
  }
}
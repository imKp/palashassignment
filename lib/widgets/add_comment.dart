//This widget is built on third page
//This widget helps in adding functionality to add comments

import 'package:flutter/material.dart';
import 'package:palashassignment/widgets/comment_button.dart';
import 'package:palashassignment/widgets/search_bart_text.dart';
import 'package:palashassignment/widgets/two_element.dart';


class AddComment extends StatefulWidget {
  final int id;
  const AddComment({
    Key? key, required this.id, 
  }) : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final searchTextController = TextEditingController();

  

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TwoElement(
    class1: SearchBarText(searchTextController: searchTextController), 
    class2: CommentButton(searchTextController: searchTextController, id: widget.id,)
    );
  }
}






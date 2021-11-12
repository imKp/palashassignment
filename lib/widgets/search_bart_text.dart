//This is a input text bar
//This text bar is required in two page
//On the first page it is used to query search
//On the third page it is used to enter comment

import 'package:flutter/material.dart';

class SearchBarText extends StatelessWidget {
  const SearchBarText({
    Key? key,
    required this.searchTextController,
  }) : super(key: key);

  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: searchTextController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Please add a comment',
        ),
      ),
    );
  }
}
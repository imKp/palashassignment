/*
   Drawn on page 1
  The first page search bar section is a complete widget consisting
   1. A search bar
   2. A search button
*/
import 'package:flutter/material.dart';

import 'package:palashassignment/model/user_data.dart';

import 'package:palashassignment/provider/search_list.dart';
import 'package:palashassignment/widgets/search_bart_text.dart';
import 'package:palashassignment/widgets/search_button.dart';
import 'package:palashassignment/widgets/two_element.dart';

import 'package:provider/src/provider.dart';




class SearchBar extends StatefulWidget {

  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchTextController = TextEditingController();
 
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final searchListModel = context.read<SearchList>();
    
    return TwoElement(class1: SearchBarText(searchTextController: searchTextController), class2: SearchButton(searchTextController: searchTextController, searchListModel: searchListModel),);
  }
}


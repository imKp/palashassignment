/*
  This page consist of two section 
  1. Search Bar -> On this section user will put the query to search from pexel.
  2. Recent Search -> A list view where all recent searches are stored.
*/

import 'package:flutter/material.dart';

import 'package:palashassignment/widgets/recent_search.dart';
import 'package:palashassignment/widgets/search_bar.dart';
import 'package:palashassignment/widgets/two_element.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palash'),
      ),
      body: const TwoElement(class1: SearchBar(), class2: RecentSearch()),
      
    );
  }
}

/*
  The recent search list is also updated as the new search is done

 */

import 'package:flutter/cupertino.dart';
import 'package:palashassignment/services/db_service.dart';


class SearchList extends ChangeNotifier{
  List<String> _searchesList = [];

  List<String> get searchList => _searchesList;

  /*
    This function is triggerd when the user press the search button,
    we add data to our local storage and notify the list is being updated.
   */
 Future saveSearch(Map<String, Object> data) async {
    DBHelper.insert('searches', data).then((value) => {_searchesList = [], notifyListeners()});
  }
  
  /* 
    This function is used as future to create ui for the first page recent search future builder.
  */
  Future<List<String>> theList() async{
    _searchesList = [];
    final listFromDb = await DBHelper.recentSearchesFromDb();
      _searchesList.addAll(listFromDb);
      return _searchesList;
  }
  
}
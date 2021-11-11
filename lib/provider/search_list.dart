import 'package:flutter/cupertino.dart';
import 'package:palashassignment/services/db_service.dart';


class SearchList extends ChangeNotifier{
  List<String> _searchesList = [];

  List<String> get searchList => _searchesList;

  
 Future saveSearch(Map<String, Object> data) async {
    DBHelper.insert('searches', data).then((value) => {_searchesList = [], notifyListeners()});
  }
  // Future<List<String>> insertAndReturn() async{
  //   DBHelper.insert(table, data)
  // }
  
  Future<List<String>> theList() async{
    _searchesList = [];
    final listFromDb = await DBHelper.recentSearchesFromDb();//.then((value) => _searchesList.addAll(value));
      _searchesList.addAll(listFromDb);
      return _searchesList;
  }
  
}
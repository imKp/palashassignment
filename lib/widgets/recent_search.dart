/*
  This is the second section of page 1.
  Here the recent five searches are shown as list.
  This is deviated from the ui design.
*/
import 'package:flutter/material.dart';
import 'package:palashassignment/model/user_data.dart';
import 'package:palashassignment/provider/search_list.dart';
import 'package:provider/src/provider.dart';



class RecentSearch extends StatefulWidget {
  const RecentSearch({Key? key}) : super(key: key);

  @override
  State<RecentSearch> createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  late SearchList searchListModel;

  @override
  void initState() {
    searchListModel = context.read<SearchList>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchListModel = context.watch<SearchList>();
    var theUser = context.read<UserData>();
    // if (searchListModel.searchList.length == 0) {
    //   searchListModel.createList('dummy');
    // }
    return FutureBuilder(
      future: searchListModel.theList(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        return ListView.builder(
          shrinkWrap: false,
          itemCount: searchListModel.searchList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(searchListModel.searchList[index]),
              onTap: () {
                theUser.titleSearched = snapshot.data![index];
                Navigator.pushNamed(context, '/searchListView');
              },
            );
          },
        );
      },
    );
  }
}

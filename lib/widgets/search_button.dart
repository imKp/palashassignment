//Drawn on page 1
//This is a simple button when clicked triggers search.
//This also calls for insertion of data to local storage.
import 'package:flutter/material.dart';
import 'package:palashassignment/model/user_data.dart';
import 'package:palashassignment/provider/search_list.dart';
import 'package:provider/src/provider.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.searchTextController,
    required this.searchListModel,
  }) : super(key: key);

  final TextEditingController searchTextController;
  final SearchList searchListModel;

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
                //DBHelper.recentSearchesFromDb().then((value) => print(value.runtimeType));
                if (searchTextController.text.isNotEmpty) {                  
                 
                   searchListModel.saveSearch({
                    'title': searchTextController.text,
                    'when_searched': DateTime.now().toString()
                  }).then((value) => {
                        //theUser.titleSearched = searchTextController.text,
                        context.read<UserData>().titleSearched = searchTextController.text,
                        //SearchesList().add(searchTextController.text),
                        //print('The search ${theUser.titleSearched} is inserted in db'),
                        Navigator.pushNamed(
                          context, '/searchListView'
                        )
                      });
                } else {
                  
                }
              },
              child: const Text('SEARCH'),
            ),
          ],
        ),
      ),
    );
  }
}

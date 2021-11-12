/*
The app is three screen app, and the name are mentioned in the order that user may experience.
1. FirstPage(Class), first_page.dart(file),
2. StreamPage(class), stream_page.dart(file),
3. DetailImageView(class), detail_image_view.dart(file), 
*/


//This is the main file
//Package built within flutter
import 'package:flutter/material.dart';

//Added to dependencies
import 'package:provider/provider.dart';

//Made classes
import 'package:palashassignment/provider/search_list.dart';
import 'package:palashassignment/model/user_data.dart';

//Routes
import 'package:palashassignment/pages/detail_image_view.dart';
import 'package:palashassignment/pages/first_page.dart';
import 'package:palashassignment/pages/stream_page.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //This provides the list that needs to be updated as recent search.
        ChangeNotifierProvider<SearchList>(create: (_) => SearchList()), 
        //The user is set here as we may need login details, and is provider to the app.
        Provider<UserData>(create: (_) => UserData(titleSearched: 'not yet serached', userId: '542178')),  
      ],
      child: MaterialApp(
        title: 'Palash',
        initialRoute: '/',
        routes: {
          //All the three routes registered on this page.
          //This is front page.
          '/': (context) => const FirstPage(), 
          //This is the second page that almost looks like IG feed.
          '/searchListView': (context) => const StreamPage(), 
          //This is the third page we get to when we click on image
          '/detailedImageView': (context) => const DetailImageView(), 
        },
      ),
    );
  }
}
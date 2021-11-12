/* 
  This file provides the interface to local sqllite.
  The recent searches and comment are stored in two seperate tables
  searches table have title as primary key, and when searched as other column.
  comments table stores data for information of comments.
*/

import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';


class DBHelper {
  //Function creates a db.
  //On creation of db it creates a table
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'palash.db'),
        // ignore: void_checks
        onCreate: (db, version) {
      return _createDb(db, version);
    }, version: 1);
  }

//Function to create two table to store searches and comment information
 static Future _createDb(Database db, int version) async{
   await db
          .execute('CREATE TABLE searches(title TEXT PRIMARY KEY, when_searched TEXT)');    
    await db
    .execute('CREATE TABLE comments(id INT PRIMARY KEY, comment TEXT)');
 }
/*
  //Function to insert data to table
  //This is a common function for insertion to both the table
  //Search table stores the title searched and when searched 
  //when searched is a datetime object stored as string
  //this can help to fetch data as searched
  //
  //Comment table stored the id of the picture that was commented and what was the comment
  */
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    //print('Into insert function');
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace, //This won't allow multiple entries of same search
    );
  }

  //We search any comment related to id of the pic using this function

  static Future<String> getCommentFromGivenId(String table, int id) async {
    final db = await DBHelper.database();
    final listOfData = await db.query(table , where: '"id" = ?', whereArgs: [id]);
    //print(listOfData);
    var theComment = listOfData[0]['comment']; 
   // print(theComment);
    return theComment.toString();
  }

 
  //This function returns the list of last five searches
  static Future<List<String>> recentSearchesFromDb() async {
  // Get a reference to the database.
  final db = await DBHelper.database();

  
  final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM searches ORDER BY when_searched DESC LIMIT 5;');

  return List.generate(maps.length, (i) {
    //print(maps[i]['title']);
    return maps[i]['title'];
  });
}

}

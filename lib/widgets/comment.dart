//Drawn on page 2
//This shows the comment if any added or no comment
import 'package:flutter/material.dart';
import 'package:palashassignment/model/photos.dart';
import 'package:palashassignment/services/db_service.dart';
import 'package:provider/provider.dart';


class Comments extends StatelessWidget {
  const Comments({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var photo = Provider.of<Photos>(context);
    //return Text(photo.id.toString());
    return FutureBuilder(
      future: DBHelper.getCommentFromGivenId('comments', photo.id),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot){
        if(snapshot.hasData){
          return Text(snapshot.data!);
        }
        else{
          return const Text('No Comments');
        }
      },
    );
  }
}
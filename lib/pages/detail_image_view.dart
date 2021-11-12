//This is the third page of the assignment
//Text to voice comment yet not implemented

/*
It's composite of two widget
1. Image in bigger screen.
2. 
a. A section to add comment.
b. A voice to text button(Not implementd yet) 
*/
import 'package:flutter/material.dart';
import 'package:palashassignment/widgets/add_comment.dart';
import 'package:palashassignment/widgets/big_image.dart';
import 'package:palashassignment/widgets/two_element.dart';

class DetailImageView extends StatefulWidget {
  const DetailImageView({ Key? key }) : super(key: key);

  @override
  State<DetailImageView> createState() => _DetailImageViewState();
}

class _DetailImageViewState extends State<DetailImageView> {
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    //print(args);
    //var photo = context.read<Photos>();
    return Scaffold(
      body: TwoElement(class1: BigImage(url: args['photo'].murl,), class2: AddComment(id: args['photo'].id),),
    );
  }
}








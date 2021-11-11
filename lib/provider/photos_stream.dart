import 'dart:async';

import 'package:palashassignment/model/photos.dart';

class PhotosModel{
  //Controller of the Stream
  final StreamController<List<Photos>> _photosController = StreamController<List<Photos>>.broadcast();
  
  //Get the stream
  Stream<List<Photos>> get outPhotos => _photosController.stream;
  
  //Add to stream
  Sink<List<Photos>> get inPhotos => _photosController.sink;

  //Dispose stream
  void dispose(){
    _photosController.close();
  }

}
import 'package:flutter/material.dart';
import 'package:palashassignment/model/photos.dart';
import 'package:palashassignment/model/user_data.dart';
import 'package:palashassignment/provider/photos_stream.dart';
import 'package:palashassignment/services/photos_service.dart';
import 'package:palashassignment/widgets/image_on_list.dart';
import 'package:provider/provider.dart';

class StreamPage extends StatefulWidget {
 
  const StreamPage({ Key? key,}) : super(key: key);
  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final ScrollController _sc = ScrollController();
  final PhotosModel _photosModel = PhotosModel();
  final _perPage = 5;
  List<Photos> _photos = [];
  var _pageCount = 1;
  var _titleSearched = '';
  

  void _theNextPage(String searchItem) async{ 
    List<Photos> _theNewList = await PhotoService.browse(_pageCount, _perPage, searchItem);
    if(_theNewList.isEmpty){
      //print('Getting Empty list');
      dispose();
    }
    else{
      _photos =_photos + _theNewList; 
      _photosModel.inPhotos.add(_photos);
      _pageCount = _pageCount + 1;
    }
  }
  @override
  void initState(){
    super.initState(); 
    _sc.addListener(() { 
      if(_sc.position.pixels == _sc.position.maxScrollExtent){
        _theNextPage(_titleSearched);
       // _sc.removeListener(() { });
        //_fetchNextPage();
      }
    });
  }

  @override
  void dispose(){
    _sc.dispose();
    _photosModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theUser = Provider.of<UserData>(context);
     _titleSearched = theUser.titleSearched;
    _theNextPage(_titleSearched);
    return Scaffold(
      body: StreamBuilder<List<Photos>>(
        stream: _photosModel.outPhotos,
        builder: (context, snapshot) {
          //print('Before list');
         //UserData _theUser = Provider.of<UserData>(context);
         //print(_theUser.titleSearched);
          List<Photos>? photo = snapshot.data;
          //print('Inside builder');
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.data != null){
            return ListView.separated(
                controller: _sc,
                itemBuilder: (BuildContext context, int index) {
                  //print(index);
                  Photos _photo = photo![index];
                  //print(index);
                  return Provider(
                    create: (_) => _photo,
                    child: 
                        const ImageOnList(),
                        //Image.network(_photo.surl),
                        //Text(_photo.id.toString()),     
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: photo!.length);
          }
          else{
            //dispose();
            return const Center(child: Text('Something Went Wrong'));
          }
        },
        
      ),
    );
  }
}





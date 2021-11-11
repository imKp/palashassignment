import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:palashassignment/model/photos.dart';

class PhotoService {
  
  static Future browse(int page, int perPage, String search) async {
    const String apiKey = 'Please Provide API key';
    final response = await http.get(
      Uri.parse(
          'https://api.pexels.com/v1/search?query=$search&page=$page&per_page=$perPage'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            apiKey,
      },
    );
    String content = response.body;
    List collection = json.decode(content)['photos'];
    //print(collection.runtimeType);
    List<Photos> _photos = [];
    for (var element in collection) {
      _photos.add(Photos(id : element['id'], surl : element['src']['small'], murl : element['src']['medium']));
      
    }
    return _photos;
  }
}



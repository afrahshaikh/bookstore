import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../book_model/bookmodel.dart';

class BookServices {
  String genreType = Get.arguments;
  var apikey='';
  Future<List<BookModel>> getAllBooks() async {
   // try {
      print('APi Started');
      print(genreType);
      var url1 =
          //'https://www.googleapis.com/books/v1/volumes?q=flowers&filter=free-ebooks&key=$apikey';
          'https://www.googleapis.com/books/v1/volumes?q=subject:$genreType';


      var response = await http
          .get(Uri.parse(url1));
          /*.timeout(Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'Unable to establish connetion . Please try again after sometime');
      });*/
print(response.body);
      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      } else {
        print('Null');
      }
   // }
   /* on TimeoutException catch (_) {
      print('Response TimeOUt');
    }*/
      return _parseBookJson(response.body);
  }

  List<BookModel> _parseBookJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);
    return jsonList
        .map((jsonBook) => BookModel(
      title: jsonBook['volumeInfo']['title'],
     //author: (jsonBook['volumeInfo']['authors'][0]),
      description: jsonBook['volumeInfo']['description'],
      thumbnailUrl: jsonBook['volumeInfo']['imageLinks']
     ['smallThumbnail'],
    ))
        .toList();
  }
    /*final jsonMap = convert.json.decode(jsonStr);
    final jsonList = jsonMap['items'];

    return jsonList
        .map((jsonBook) => BookModel(
      title: jsonBook['volumeInfo']['title'],
      author: (jsonBook['volumeInfo']['authors'] as List).join(', '),
   //   author: jsonBook['volumeInfo']['authors'],
      description: jsonBook['volumeInfo']['description'],
      thumbnailUrl: jsonBook['volumeInfo']['imageLinks']
      ['smallThumbnail'],
    ))
        .toList();
  }*/
}

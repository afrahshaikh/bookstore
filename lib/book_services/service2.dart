import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../book_model/bookmodel.dart';

class SearchedBookServices {

  String searchItem = Get.arguments;
  Future<List<BookModel>> getSearchedBooks() async {
   // try {
      print('APi Started');
     
      var url2 = 'https://www.googleapis.com/books/v1/volumes?q=$searchItem';

      var response = await http
          .get(Uri.parse(url2));
print(response.statusCode);
      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      } else {
        print('Null');
      }
      return _parseBookJson(response.body);
  }

  List<BookModel> _parseBookJson(String jsonStr) {
    final jsonMap = convert.json.decode(jsonStr);
    final jsonList = (jsonMap['items'] as List);
    return jsonList
        .map((jsonBook) => BookModel(
              title: jsonBook['volumeInfo']['title'],
     // author: (jsonBook['volumeInfo']['authors'] as List).join(', '),
              description: jsonBook['volumeInfo']['description'],
              thumbnailUrl: jsonBook['volumeInfo']['imageLinks']
                  ['smallThumbnail'],
            ))
        .toList();
  }
}

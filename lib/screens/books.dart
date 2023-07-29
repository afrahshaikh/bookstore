import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookstore/book_controllers.dart/bookController.dart';
import 'package:bookstore/book_model/bookmodel.dart';
import 'package:bookstore/screens/bookDetails.dart';

class Books extends StatelessWidget {
  final BookModel ?book;
  Books({this.book});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(BookController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
            child: Text(  
          'Books on ${Get.arguments}',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Obx(() {
              return controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      itemCount: controller.getbooks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
                      itemBuilder: (context, index) {
                        var item = controller.getbooks[index];
                        return GestureDetector(

                            onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Gesture Detected!')));
                          _openDetailPage(context, item);
                        },
                        child: Container(

                        height: 100,
                        child:Container(child: Card(
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                          Expanded(
                          child: Image.network(
                          item.thumbnailUrl!,
                            fit: BoxFit.contain,
                          ),
                        ),
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          /*ListTile(

                            title: Text(item.title),
                           // subtitle: Text(item.author),
                            leading: Image.network(item.thumbnailUrl!),
                            onTap: () {
                              _openDetailPage(context, item);
                            },
                          ),*/
                        ])   )  ),)  );
                      },
                    );
            }),
          )
        ],
      )),
    );
  }

//   void _navigateToDetailsPage(BookModel book, BuildContext context) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => BookDetails(book),
//     ),
//   );
// }
  _openDetailPage(context, BookModel book) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => BookDetails(book: book)));
  }
}

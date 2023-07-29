import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookstore/book_services/services.dart';
import 'package:bookstore/screens/books.dart';
import 'package:bookstore/widgets/resuableCard.dart';
import 'package:bookstore/widgets/textfield_decoration.dart';

class Genres extends StatelessWidget {
  bool isClicked = false;
  String name = '';
 // BookServices service = BookServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: Icon(Icons.book),
        title: Text(
          'Select Genre',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFieldDecoration(),
              ReusableCard(
                color: Colors.black12,
                text: 'Fiction',
                onTap: () {
                  Get.to(Books(), arguments: 'fiction');
                },
              ),
              ReusableCard(
                color: Colors.black26,
                text: 'Comedy',
                onTap: () {
                  Get.to(Books(), arguments: 'comedy');
                },
              ),
              ReusableCard(
                color: Colors.black38,
                text: 'Romance',
                onTap: () {
                  Get.to(Books(), arguments: 'romance');
                },
              ),
              ReusableCard(
                color: Colors.black45,
                text: 'Drama',
                onTap: () {
                  Get.to(Books(), arguments: 'drama');
                },
              ),
              ReusableCard(
                color: Colors.black54,
                text: 'Science',
                onTap: () {
                  Get.to(Books(), arguments: 'science');
                },
              ),
              ReusableCard(
                color: Colors.black87,
                text: 'Computers',
                onTap: () {
                  Get.to(Books(), arguments: 'computers');
                },
              ),
              SizedBox(
                height: 20,
              ),
            /*  Center(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },

                ),
              )*/
            ],
          ))
        ],
      )),
    );
  }
}

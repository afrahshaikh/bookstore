import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookstore/screens/books2.dart';
//Search books by name
class TextFieldDecoration extends StatelessWidget {
  String bookName = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          bookName = value;
        },
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                Get.to(SearchedBooks(), arguments: bookName);
              },
              child: Icon(
                Icons.search_rounded,
                color: Colors.blueGrey,
                size: 50,
              ),
            ),
            hintText: 'Search Books by name',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black87,
                ),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}

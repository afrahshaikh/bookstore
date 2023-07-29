import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../book_services/authentication.dart';
import 'sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center ,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Text(
                  'Book',
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 40),
                child: Text(
                  'Store',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 55.0, left: 150),
                child: Icon(
                  Icons.book_rounded,
                  size: 40,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.grey,
                color: Colors.black,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Get.to(SignIn());
                  },
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.blue,
                color: Colors.blueGrey,
                elevation: 7.0,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/genres');
                  },
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'CONTINUE WITHOUT LOGIN',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                ),
              ),
            ),
          ),

        ],
      )),
    );
  }
}

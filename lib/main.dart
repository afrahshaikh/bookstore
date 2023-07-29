import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookstore/screens/books.dart';
import 'package:bookstore/screens/genres.dart';
import 'package:bookstore/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
/*  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Finder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: [
          GetPage(
              name: '/',
              page: () => WelcomeScreen(),
              transition: Transition.fadeIn),
          GetPage(
              name: '/genres',
              page: () => Genres(),
              transition: Transition.rightToLeftWithFade),
          GetPage(
              name: '/books',
              page: () => Books(),
              transition: Transition.rightToLeftWithFade),
        ],
        initialRoute: '/'
        // home: DropDownDemo(),
        );
  }
}

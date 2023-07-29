import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../book_services/authentication.dart';
import '../widgets/decoration.dart';
import 'genres.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  /*final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
    margin: EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 15,
    ),
    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    border: Border.all(
    color: Colors.black,
    width: 1,
    ),
    ),
    child: TextFormField(
    key: _formKey,
    controller: _email,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter some text';
    }
    return null;
    },
    decoration: InputDecoration(
    prefixIcon: Icon(Icons.email),
    hintText: "Email",
    hintStyle: TextStyle(fontFamily: 'Montserrat'),
    border: InputBorder.none,
    ),
    obscureText: false!,
    ),
    ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: TextFormField(
              key: _formKey,
              controller: _password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                hintStyle: TextStyle(fontFamily: 'Montserrat'),
                border: InputBorder.none,
              ),
              obscureText: true!,
            ),
          ),



          *//*Textdec(
            control: _email,
            hint: "Email",
            icon1: Icon(Icons.email),
            show: false,
          ),*//*
        *//*  Textdec(
            control: _password,
            hint: "Password",
            icon1: Icon(Icons.lock),
            show: true,
          ),*//*
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                bool showNavigate = await loginIn(_email.text, _password.text);
                if (showNavigate) {
                  Get.to(Genres(), transition: Transition.rightToLeftWithFade);
                }
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }*/
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
    height: 20,
    ),
      Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Email"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool showNavigate = await loginIn(emailController.text, passwordController.text);
                        if (showNavigate) {
                          Get.to(Genres(), transition: Transition.rightToLeftWithFade);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
   ] ));
  }
}

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

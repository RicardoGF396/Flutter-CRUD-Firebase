import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/components/defaultInput.dart';
import 'package:flutter_firebase/views/user/user.dart';

import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  String password = "";

  void validateInputs() {
    if (formKey.currentState!.validate()) {
      if (name == 'bruno' && password == '12345') {
        // Aquí realizas la acción de éxito
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color(0xFF1E1C24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              content: SizedBox(
                height: 112,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/error-icon.svg'),
                      const SizedBox(height: 16),
                      const Text(
                        'Invalid username or password',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                        minimumSize: MaterialStateProperty.all(Size(140, 50)),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          TextStyle(fontSize: 16),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Okay',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 32, 1),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: Container(
                margin: EdgeInsets.only(top: 42),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/logoFlutter.svg'),
                    SizedBox(
                      height: 96,
                    ),
                    const Text("Let's sign you in",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    const Text(
                      "Welcome back",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    const Text(
                      "You have been missed!",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      DefaultInput(
                          hintText: "Username",
                          labelText: "Username",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter a correct username';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          obscureText: false),
                      const SizedBox(
                        height: 16,
                      ),
                      DefaultInput(
                        hintText: "Password",
                        labelText: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a correct password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 82,
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Don’t have an account?",
                              style: TextStyle(
                                  color: Color.fromRGBO(117, 117, 117, 1)),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 60)),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(fontSize: 18),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        onPressed: validateInputs,
                        child: const Text('Log in'),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

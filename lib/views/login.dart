import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();
  String name = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Image.asset('lib/assets/Login-image.jpg', fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: 
                Column(
                  children: [
                    const SizedBox(height: 24,),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter your user"
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Enter your passoword"
                      ),
                    ),
                  ],
                )
            ),
            )
        ],
      ),
    );
  }
}
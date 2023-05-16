import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/headerList.dart';
import 'package:flutter_firebase/views/services/user-service/user_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/defaultInput.dart';

class UserFormScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController lastnameController = TextEditingController(text: "");
  TextEditingController ageController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController genderController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController idController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 32, 1),
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            HeaderList(
              title: "User",
              subtitle: "Register a new",
              onBack: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Form(
                  child: Column(
                children: [
                  DefaultInput(
                      hintText: "Name",
                      labelText: "Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct name';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: nameController),
                  SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Lastname",
                      labelText: "Lastname",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct lastname';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: lastnameController),
                      SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Age",
                      labelText: "Age",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct age';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: ageController),
                      SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Email",
                      labelText: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct email';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: emailController),
                      SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Gender",
                      labelText: "Gender",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct password';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: genderController),
                      SizedBox(
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
                      obscureText: false,
                      controller: passwordController),

                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize:
                          MaterialStateProperty.all(Size(double.infinity, 60)),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(fontSize: 18),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await addUser(
                        ageController.text,
                        emailController.text,
                        genderController.text,
                        idController.text,
                        nameController.text,
                        lastnameController.text,
                        passwordController.text
                      ).then((_) {
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, '/listUser');
                      });
                    },
                    child: const Text('Add'),
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

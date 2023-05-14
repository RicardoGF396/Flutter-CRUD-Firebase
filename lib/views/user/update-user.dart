import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/defaultInput.dart';
import 'package:flutter_firebase/views/services/user-service/user_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdateUserScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController lastnameController = TextEditingController(text: "");
  TextEditingController ageController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController genderController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController idController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final uid = arguments["uid"];
    nameController.text = arguments['name'];
    lastnameController.text = arguments['lastname'];
    emailController.text = arguments['email'];
    ageController.text = arguments['age'];
    genderController.text = arguments['gender'];
    passwordController.text = arguments['password'];

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
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("User",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    const Text(
                      "Update User",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "ID: " + uid,
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 180, 180, 180),
                          fontWeight: FontWeight.w300),
                    ),
                  SizedBox(height: 16,),
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
                      await updateUser(
                              uid,
                              nameController.text,
                              lastnameController.text,
                              emailController.text,
                              ageController.text,
                              genderController.text,
                              passwordController.text,
                              idController.text,
                              )
                          .then((_) {
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, '/listUser');
                      });
                    },
                    child: const Text('Update'),
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

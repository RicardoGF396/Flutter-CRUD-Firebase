import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/defaultInput.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormPurchaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    const Text("Purchase",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    const Text(
                      "Register a new Purchase",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ),
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
                        return 'Enter a correct password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultInput(
                    hintText: "Pieces",
                    labelText: "Pieces",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a correct Pieces';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultInput(
                    hintText: "IDA",
                    labelText: "IDA",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a correct IDA';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
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
                    onPressed: () {},
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

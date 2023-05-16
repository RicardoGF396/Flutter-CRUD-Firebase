import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/defaultInput.dart';
import 'package:flutter_firebase/views/services/purchase-service/firebase_service.dart';
import 'package:flutter_firebase/components/headerList.dart';

// ignore: must_be_immutable
class FormPurchaseScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController piecesController = TextEditingController(text: "");
  TextEditingController idaController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 32, 1),
      extendBody: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            HeaderList(
              title: "Purchase",
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
                        if (nameController.text == "") {
                          return 'Enter a correct password';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: nameController),
                  const SizedBox(
                    height: 15,
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
                      obscureText: false,
                      controller: piecesController),
                  const SizedBox(
                    height: 15,
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
                      obscureText: false,
                      controller: idaController),
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
                      await addPurchase(nameController.text,
                              piecesController.text, idaController.text)
                          .then((_) {
                        Navigator.pop(context);
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

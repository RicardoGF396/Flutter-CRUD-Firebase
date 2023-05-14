import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/defaultInput.dart';
import 'package:flutter_firebase/components/headerList.dart';
import 'package:flutter_firebase/views/services/sales-service/sales_service.dart';

// ignore: must_be_immutable
class FormSaleScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController quantityController = TextEditingController(text: "");
  TextEditingController piecesController = TextEditingController(text: "");
  TextEditingController idcController = TextEditingController(text: "");
  TextEditingController idvController = TextEditingController(text: "");
  TextEditingController subtotalController = TextEditingController(text: "");
  TextEditingController totalController = TextEditingController(text: "");

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
              title: "Sale",
              subtitle: "Register a new",
              onBack: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 15,
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
                          return 'Enter a correct Name';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: nameController),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultInput(
                      hintText: "Quantity",
                      labelText: "Quantity",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct Quantity';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: quantityController),
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
                      hintText: "IDC",
                      labelText: "IDC",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct IDC';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: idcController),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultInput(
                      hintText: "IDV",
                      labelText: "IDV",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct IDV';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: idvController),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultInput(
                      hintText: "Subtotal",
                      labelText: "subtotal",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct subtotal';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: subtotalController),
                  const SizedBox(
                    height: 15,
                  ),
                  DefaultInput(
                      hintText: "Total",
                      labelText: "Total",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct Total';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: totalController),
                  const SizedBox(
                    height: 20,
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
                      await addSale(
                              nameController.text,
                              quantityController.text,
                              piecesController.text,
                              idcController.text,
                              idvController.text,
                              subtotalController.text,
                              totalController.text)
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

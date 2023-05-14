import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/services/product-service/product_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/defaultInput.dart';

class ProductFormScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descriptionController= TextEditingController(text: "");
  TextEditingController costController = TextEditingController(text: "");
  TextEditingController priceController = TextEditingController(text: "");
  TextEditingController unitsController = TextEditingController(text: "");
  TextEditingController utilityController = TextEditingController(text: "");

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
                    const Text("Product",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        )),
                    const Text(
                      "Register a new product",
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
                      hintText: "Description",
                      labelText: "Description",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct description';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: descriptionController),
                      SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Cost",
                      labelText: "Cost",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct age';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: costController),
                      SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Price",
                      labelText: "Price",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct price';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: priceController),
                      SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Units",
                      labelText: "Units",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct type of units';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: unitsController),
                      SizedBox(
                    height: 16,
                  ),
                  DefaultInput(
                      hintText: "Utility",
                      labelText: "Utility",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct utility';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: utilityController),

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
                      await addProduct(
                        nameController.text,
                        descriptionController.text,
                        priceController.text,
                        unitsController.text,
                        costController.text,
                        utilityController.text,
                      ).then((_) {
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, '/listProduct');
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

import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/defaultInput.dart';
import 'package:flutter_firebase/views/services/product-service/product_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpdateProductScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descriptionController= TextEditingController(text: "");
  TextEditingController costController = TextEditingController(text: "");
  TextEditingController priceController = TextEditingController(text: "");
  TextEditingController unitsController = TextEditingController(text: "");
  TextEditingController utilityController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final uid = arguments["uid"];
    nameController.text = arguments['name'];
    descriptionController.text = arguments['description'];
    costController.text = arguments['cost'];
    priceController.text = arguments['price'];
    unitsController.text = arguments['units'];
    utilityController.text = arguments['utility'];

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
                      "Update Product",
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
                      hintText: "Cost",
                      labelText: "Cost",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a correct cost';
                        }
                        return null;
                      },
                      obscureText: false,
                      controller: costController),
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
                      await updateProduct(
                              uid,
                              nameController.text,
                              descriptionController.text,
                              priceController.text,
                              unitsController.text,
                              costController.text,
                              utilityController.text
                              )
                          .then((_) {
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, '/list-product');
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

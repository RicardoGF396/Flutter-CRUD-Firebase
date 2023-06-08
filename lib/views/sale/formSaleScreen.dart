import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/defaultInput.dart';
import 'package:flutter_firebase/components/headerList.dart';
import 'package:flutter_firebase/views/services/product-service/product_service.dart';
import 'package:flutter_firebase/views/services/sales-service/sales_service.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class FormSaleScreen extends StatefulWidget {
  @override
  State<FormSaleScreen> createState() => _FormSaleScreenState();
}

class _FormSaleScreenState extends State<FormSaleScreen> {
  TextEditingController quantityController = TextEditingController(text: "");

  TextEditingController piecesController = TextEditingController(text: "");

  TextEditingController idcController = TextEditingController(text: "");

  TextEditingController idvController = TextEditingController(text: "");

  TextEditingController subtotalController = TextEditingController(text: "");

  TextEditingController totalController = TextEditingController(text: "");

  String uidProduct = "";
  String productName = "Select a product to sell";
  String quantityAvailable = "0";
  int finalQuantity = 0;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Color(0xFF3D3C46)),
    );

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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF1E1C24),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFF3D3C46)),
                    ),
                    child: FutureBuilder<List>(
                      future: getProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List products = snapshot.data!;
                          return DropdownButton<String>(
                            hint: Text(
                              productName,
                              style: TextStyle(color: Colors.white38),
                            ),
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            items: products
                                .map<DropdownMenuItem<String>>((product) {
                              return DropdownMenuItem<String>(
                                value: product['uid'],
                                child: Text(product['name']),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                uidProduct = newValue!;
                                Map<String, dynamic> selectedProduct =
                                    products.firstWhere((product) =>
                                        product['uid'] == newValue);
                                productName = selectedProduct['name'];
                                quantityAvailable = selectedProduct['units'];
                              });
                            },
                          );
                        } else if (snapshot.hasError) {
                          print("Error");
                        }
                        return const CircularProgressIndicator(); // Devuelve un widget en caso de que aún se esté cargando el resultado
                      },
                    ),
                  ),
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
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          int enteredQuantity = int.tryParse(newValue) ?? 0;
                          int availableQuantity = int.tryParse(quantityAvailable) ?? 0;
                          if (enteredQuantity > availableQuantity) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Invalid Quantity'),
                                  content: Text(
                                      'You cannot add a quantity greater than the available quantity.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        quantityController.text = "";
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }else{
                            int enteredQuantity = int.tryParse(newValue) ?? 0;
                            int availableQuantity = int.tryParse(quantityAvailable) ?? 0;

                            finalQuantity = availableQuantity -enteredQuantity;
                            print(finalQuantity);

                          }
                        }
                      },
                      controller: quantityController),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      "Quantity available: $quantityAvailable",
                      style: TextStyle(color: Colors.white30),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  /* const SizedBox(
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
                      controller: piecesController), */
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
                              uidProduct,
                              productName,
                              finalQuantity.toString(),
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

import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/headerList.dart';
import 'package:flutter_firebase/views/services/sales-service/sales_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListSaleScreen extends StatefulWidget {
  @override
  _ListSaleScreenState createState() => _ListSaleScreenState();
}

class _ListSaleScreenState extends State<ListSaleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 32, 1),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            HeaderList(
              title: "Sales",
              onBack: () {
                Navigator.pop(context);
              },
            ),
            FutureBuilder(
              future: getSales(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: Dismissible(
                            key: Key(snapshot.data?[index]['uid']),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) async {
                              await deleteSale(snapshot.data?[index]['uid']);
                              snapshot.data?.removeAt(index);
                            },
                            confirmDismiss: (direction) async {
                              bool result = false;
                              result = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Color(0xFF1E1C24),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      content: SizedBox(
                                        height: 140,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/error-icon.svg'),
                                              const SizedBox(height: 16),
                                              Text(
                                                textAlign: TextAlign.center,
                                                "Do you want to delete ${snapshot.data?[index]["name"]}?",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black),
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        Size(140, 50)),
                                                textStyle: MaterialStateProperty
                                                    .all<TextStyle>(
                                                  TextStyle(fontSize: 16),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99),
                                                    side: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                return Navigator.pop(
                                                    context, true);
                                              },
                                              child: const Text(
                                                'Confirm',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 16),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                minimumSize:
                                                    MaterialStateProperty.all(
                                                        Size(140, 50)),
                                                textStyle: MaterialStateProperty
                                                    .all<TextStyle>(
                                                  TextStyle(fontSize: 16),
                                                ),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            99),
                                                    side: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                return Navigator.pop(
                                                    context, false);
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                              return result;
                            },
                            background: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 24),
                              color: Colors.red,
                              child: const Icon(Icons.delete, color: Colors.white,),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              leading: Icon(Icons.shopping_bag_outlined,
                                  color: Colors.white, size: 40),
                              trailing: Icon(
                                Icons.edit,
                                color: Color.fromARGB(150, 230, 230, 230),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  snapshot.data?[index]['name'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /* Text(
                                          "Pieces: " +
                                              snapshot.data?[index]['pieces'],
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  150, 230, 230, 230)),
                                        ), */
                                        Text(
                                          "Quantity: " +
                                              snapshot.data?[index]['quantity'],
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  150, 230, 230, 230)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Subtotal: " +
                                              snapshot.data?[index]['subtotal'],
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  150, 230, 230, 230)),
                                        ),
                                        Text(
                                          "Total: " +
                                              snapshot.data?[index]['total'],
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              onTap: (() async {
                                await Navigator.pushNamed(context, '/editSale',
                                    arguments: {
                                      'uid': snapshot.data?[index]['uid'],
                                      "name": snapshot.data?[index]['name'],
                                      "quantity": snapshot.data?[index]
                                          ['quantity'],
                                      "pieces": snapshot.data?[index]['pieces'],
                                      "idc": snapshot.data?[index]['idc'],
                                      "idv": snapshot.data?[index]['idv'],
                                      "subtotal": snapshot.data?[index]
                                          ['subtotal'],
                                      "total": snapshot.data?[index]['total'],
                                    });
                                setState(() {});
                              }),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          await Navigator.pushNamed(context, '/addSale');
          setState(() {});
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

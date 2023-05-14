import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/services/purchase-service/firebase_service.dart';
import 'package:flutter_firebase/components/headerList.dart';

class ListPurchaseScreen extends StatefulWidget {
  @override
  _ListPurchaseScreenState createState() => _ListPurchaseScreenState();
}

class _ListPurchaseScreenState extends State<ListPurchaseScreen> {
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
              title: "Purchase",
              onBack: () {
                Navigator.pop(context);
              },
            ),
            FutureBuilder(
              future: getPurchase(),
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
                              await deletePurchase(
                                  snapshot.data?[index]['uid']);
                              snapshot.data?.removeAt(index);
                            },
                            confirmDismiss: (direction) async {
                              bool result = false;
                              result = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "Are you sure you want to delete ${snapshot.data?[index]['name']}?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              return Navigator.pop(
                                                  context, false);
                                            },
                                            child: const Text('Undo')),
                                        TextButton(
                                            onPressed: () {
                                              return Navigator.pop(
                                                  context, true);
                                            },
                                            child: const Text('Yes'))
                                      ],
                                    );
                                  });
                              return result;
                            },
                            background: Container(
                              color: Colors.red,
                              child: const Icon(Icons.delete),
                            ),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                /* side:
                                    BorderSide(color: Color(0xFF3D3C46), width: 2), */
                              ),
                              leading: Icon(Icons.assignment,
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
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pieces: " +
                                        snapshot.data?[index]['pieces'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(150, 230, 230, 230)),
                                  ),
                                  Text(
                                    "IDA: " + snapshot.data?[index]['ida'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(150, 230, 230, 230)),
                                  ),
                                ],
                              ),
                              onTap: (() async {
                                await Navigator.pushNamed(
                                    context, '/editPurchase',
                                    arguments: {
                                      'uid': snapshot.data?[index]['uid'],
                                      "name": snapshot.data?[index]['name'],
                                      "pieces": snapshot.data?[index]['pieces'],
                                      "ida": snapshot.data?[index]['ida'],
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
          await Navigator.pushNamed(context, '/addPurchase');
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

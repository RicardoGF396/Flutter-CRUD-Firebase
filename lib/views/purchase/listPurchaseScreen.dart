import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/services/purchase-service/firebase_service.dart';

class ListPurchaseScreen extends StatefulWidget {
  @override
  _ListPurchaseScreenState createState() => _ListPurchaseScreenState();
}

class _ListPurchaseScreenState extends State<ListPurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Purchase")),
      body: FutureBuilder(
        future: getPurchase(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data?[index]['name']);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context,'/addPurchase');
          setState((){});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/services/purchase-service/firebase_service.dart';

class ListPurchaseScreen extends StatelessWidget {
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
        onPressed: () {
          Navigator.pushNamed(context,'/addPurchase');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

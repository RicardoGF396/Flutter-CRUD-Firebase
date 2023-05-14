import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/headerList.dart';
import 'package:flutter_firebase/views/services/user-service/user_service.dart';

class UserScreen extends StatelessWidget {
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
              title: "Users",
              onBack: () {
                Navigator.pop(context);
              },
            ),
            FutureBuilder(
              future: getUsers(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              /* side:
                                  BorderSide(color: Color(0xFF3D3C46), width: 2), */
                            ),
                            leading: Icon(Icons.account_circle_sharp,
                                color: Colors.white, size: 40),
                            trailing: Icon(
                              Icons.edit,
                              color: Color.fromARGB(150, 230, 230, 230),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Row(
                                children: [
                                  Text(
                                snapshot.data?[index]['name'],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 4,),
                                  Text(
                                snapshot.data?[index]['lastname'],
                                style: TextStyle(color: Colors.white),
                              ),
                                ],
                              )
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email: " + snapshot.data?[index]['email'],
                                  style: TextStyle(
                                      color: Color.fromARGB(150, 230, 230, 230)),
                                ),
                                Text(
                                  "Gender: " + snapshot.data?[index]['gender'],
                                  style: TextStyle(
                                      color: Color.fromARGB(150, 230, 230, 230)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    "Age: " + snapshot.data?[index]['age'],
                                    style: TextStyle(
                                        color: Color.fromARGB(150, 230, 230, 230)),
                                  ),
                                ),
                              ],
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
        onPressed: () {
          Navigator.pushNamed(context, '/user-form');
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

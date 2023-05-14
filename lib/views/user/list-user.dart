import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/headerList.dart';
import 'package:flutter_firebase/views/services/user-service/user_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Dismissible(
                            onDismissed: (direction) async {
                              await deleteUser(snapshot.data?[index]["uid"]);
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
                                                return Navigator.pop(context, true);
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
                                                return Navigator.pop(context, false);
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
                            key: Key(snapshot.data?[index]["uid"]),
                            background: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 24),
                              color: Colors.red,
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            direction: DismissDirection.startToEnd,
                            child: ListTile(
                              leading: const Icon(Icons.account_circle_sharp,
                                  color: Colors.white, size: 40),
                              trailing: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/updateUser',
                                      arguments: {
                                        "uid": snapshot.data?[index]["uid"],
                                        "name": snapshot.data?[index]["name"],
                                        "lastname": snapshot.data?[index]
                                            ["lastname"],
                                        "email": snapshot.data?[index]["email"],
                                        "gender": snapshot.data?[index]
                                            ["gender"],
                                        "age": snapshot.data?[index]["age"],
                                        "password": snapshot.data?[index]
                                            ["password"],
                                      });
                                },
                                child: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(150, 230, 230, 230),
                                ),
                              ),
                              title: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        snapshot.data?[index]['name'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        snapshot.data?[index]['lastname'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email: " + snapshot.data?[index]['email'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(150, 230, 230, 230)),
                                  ),
                                  Text(
                                    "Gender: " +
                                        snapshot.data?[index]['gender'],
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(150, 230, 230, 230)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      "Age: " + snapshot.data?[index]['age'],
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              150, 230, 230, 230)),
                                    ),
                                  ),
                                ],
                              ),
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
          Navigator.pushNamed(context, '/addUser');
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

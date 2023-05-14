import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/headerList.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 23, 32, 1),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            HeaderList(
              title: "Users",
              onBack: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderList extends StatelessWidget {
  final Function onBack;
  final String? title;
  final String? subtitle;

  const HeaderList({Key? key, required this.onBack, this.title,this.subtitle});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16,),
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              onBack();
            },
          ),
          /* actions: [
            Image.asset('assets/bruno.png'),
          ], */
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle ?? 'List of',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                title ?? 'Default value',
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    );
  }
}
